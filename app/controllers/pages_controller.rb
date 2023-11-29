
class PagesController < ApplicationController

  def home
    fetcher = FetchAndSaveArticlesFromBing.new(keyword: "trending", freshness: "week")
    fetcher.call
    @articles = Article.all
  end
end
