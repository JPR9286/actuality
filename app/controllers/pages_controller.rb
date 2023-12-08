
class PagesController < ApplicationController

  def home
    fetcher = FetchAndSaveArticlesFromBing.new(freshness: "week", category_present: false)
    fetcher.call
    @articles = Article.where.not(content: nil).order(created_at: :desc)
  end
end
