class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
  end

  def fetch_summary
    @article = Article.find(params[:id])
    if @article.content.present?
      @article.summary = AskOpenaiForSummary.new(@article.content).call
      @article.save
    end
    render json: @article.to_json
  end

  def index
    @articles = Article.all
  end
end
