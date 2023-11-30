class FetchAndSaveArticlesFromBing
  def initialize(keyword:, freshness: "week")
    @keyword = keyword
    @freshness = freshness
    @summary = summary
  end

  def call
    bing_articles = GetNewsFromBing.new(keyword: @keyword, freshness: @freshness).call
    SaveNewsFromBingInDb.new(articles: bing_articles).call
  end
end
