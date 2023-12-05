class SearchesController < ApplicationController

  def index
    # @articles = Article.where.not(content: nil).order(created_at: :desc)
    if params[:query].present?
      FetchAndSaveArticlesFromBing.new(keyword: params[:query], freshness: "week").call
      @articles = Article.search_by_title_and_description(params[:query])
      @chatrooms = Chatroom.search_by_title(params[:query])
    else
      @articles = FetchAndSaveArticlesFromBing.new(freshness: "week", category_present: false).call
      # FetchAndSaveArticlesFromBing.new(freshness: "week")
      # @articles = Article.order(created_at: :desc)
      @chatrooms = Chatroom.all
    end
  end

end
