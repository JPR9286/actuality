
class PagesController < ApplicationController

  def home
    fetcher = FetchAndSaveArticlesFromBing.new(freshness: "day", category_present: false)
    fetcher.call
    @articles = Article.all
  end
end
