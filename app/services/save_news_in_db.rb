class SaveNewsInDb
  def initialize(news:)
    @news = news
  end

  def call
    @news.each do |api_article|
      Article.create!(
        title: api_article.title,
        description: api_article.description,
        source: api_article.name,
        article_url: api_article.url,
        image_url: api_article.urlToImage
      )
    end
  end
end
