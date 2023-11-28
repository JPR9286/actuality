require "news-api"

class PagesController < ApplicationController
skip_before_action :authenticate_user!, only: [ :home ]

  def index
    response = Article.get("https://newsapi.org/v2/top-headlines?country=fr&apiKey=9ceb268dcd214694aaa30cf4ddd4d371")
    @articles = response.parsed_response['articles']
  end

  def home
  end

end
