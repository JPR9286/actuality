class FetchAndSaveArticlesFromBing
  def initialize(keyword:, freshness: "week")
    @keyword = keyword
    @freshness = freshness
  end

  def call
    bing_articles = GetNewsFromBing.new(keyword: @keyword, freshness: @freshness).call
    SaveNewsFromBingInDb.new(articles: bing_articles).call if bing_articles
  end
end
