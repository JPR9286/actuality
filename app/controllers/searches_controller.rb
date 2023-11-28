class SearchesController < ApplicationController

  def index
    if params[:query].present?
      @articles = Article.search_by_title_and_description(params[:query])
      @chatrooms = Chatroom.search_by_title(params[:query])
    else
      @articles = Article.all
      @chatrooms = Chatroom.all
    end
  end
end
