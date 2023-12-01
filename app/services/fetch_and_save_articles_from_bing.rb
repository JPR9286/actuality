class FetchAndSaveArticlesFromBing
  def initialize(keyword: "trending", freshness: "week", category_present: true)
    @keyword = keyword
    @freshness = freshness
    @category_present = category_present
  end

  def call
    bing_articles = GetNewsFromBing.new(keyword: @keyword, freshness: @freshness).call
    SaveNewsFromBingInDb.new(articles: bing_articles).call if bing_articles
    SaveNewsFromBingInDb.new(articles: bing_articles, category_present: @category_present).call
  end
end
