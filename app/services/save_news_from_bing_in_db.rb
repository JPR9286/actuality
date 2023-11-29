class SaveNewsFromBingInDb
  def initialize(articles:)
    @articles = articles
  end

  def call
    articles_to_save.map do |api_article|
      Article.create(
        title: api_article['name'],
        description: api_article['description'],
        source: api_article["provider"].first["name"],
        article_url: api_article['url'],
        image_url: api_article['image']['contentUrl'],
        date_article: api_article['datePublished'],
        category: category(api_article['category'])
      )
    end
  end

  private

  def category(bing_category)
    Category.find_or_create_by(name: bing_category.underscore.gsub("_", " "))
  end

  def articles_to_save
    @articles.select do |article|
      article['image'].present? && article['category'].present?
    end
  end
end
