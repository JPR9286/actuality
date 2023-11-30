class FetchAndSaveArticlesFromBing
  def initialize(keyword: nil, freshness: "week", category_present: true)
    @keyword = keyword
    @freshness = freshness
    @category_present = category_present
  end

  def call
    bing_articles = GetNewsFromBing.new(keyword: @keyword, freshness: @freshness).call
    SaveNewsFromBingInDb.new(articles: bing_articles, category_present: @category_present).call
  end
end

# FetchAndSaveArticlesFromBing.new(keyword: "anne hidalgo", freshness: "week").call
