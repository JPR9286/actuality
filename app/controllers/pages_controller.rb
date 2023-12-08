
class PagesController < ApplicationController

  def home
    fetcher = FetchAndSaveArticlesFromBing.new(freshness: "week", category_present: false)
    fetcher.call
    @articles = Article.where.not(content: nil).sort_by { |a| a.date_article }.reverse
  end
end
