class SaveNewsFromBingInDb
  def initialize(articles:, category_present: true)
    @articles = articles
    @category_present = category_present
  end

  def call
    puts "#{articles_to_save.size} articles to be saved in DB..."
    articles_to_save.map do |api_article|
      Article.find_or_create_by(
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
    return nil unless bing_category

    Category.find_or_create_by(name: bing_category.underscore.gsub("_", " "))
  end

  def articles_to_save
    articles_with_photo = @articles.select do |article|
      article['image'].present?
    end
    @category_present ? articles_with_photo.select { |a| a['category'].present? } : articles_with_photo
  end
end
