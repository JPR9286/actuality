class UpdateArticleWithDiffbot
  def initialize(article)
    @article = article
  end

  def call
    return if @article.content.present?

    article_data = ExtractTextFromUrl.new(@article.article_url).call || {}
    return if article_data[:text]&.include?('cookies') # skip articles that are not readable
    return if article_data[:text].nil?

    @article.update(
      category: article_data[:category],
      content: article_data[:text]
    )
  end
end
if @article_data["summary"].present?
  category_in_french = category_translation[@article_data["categories"].first]
  Article.create!(title: @article_data["title"], content: @article_data["text"], category_in_french: category_in_french)
end
