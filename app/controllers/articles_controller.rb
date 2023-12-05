class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
  end

  def fetch_summary
    @article = Article.find(params[:id])
    if @article.content.present?
      if params[:length] <= 50
        @article.summary = AskOpenaiForSummary.new(@article.content, length: params[:length]).call
      else
        @article.long_summary = AskOpenaiForSummary.new(@article.content, length: params[:length]).call
      end
    else
      if params[:length] <= 50
        @article.summary = AskOpenaiForSummaryWithoutContent.new(@article.title, @article.description, length: params[:length]).call
      else
        @article.long_summary = AskOpenaiForSummaryWithoutContent.new(@article.title, @article.description, length: params[:length]).call
      end
    end
    @article.save

    render json: @article.to_json
  end

  def index
    @articles = Article.all
  end
end
