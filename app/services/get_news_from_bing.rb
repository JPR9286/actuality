require 'rest-client'

class GetNewsFromBing
  def initialize(keyword: nil, freshness: "week")
    @keyword = keyword
    @freshness = freshness
    @articles = []
    @responses = []
  end

  def call
    @articles << api_call
    @articles.flatten!
    puts "#{@articles.size} récupérés"
    while @responses.size < 3 && @articles.size < 30
      @articles << api_call(@articles.size).flatten
        @articles.flatten!
      puts "#{@articles.size} récupérés"
    end

    puts "#{@articles.size} articles fetched!"
    return @articles
  end

  private

  def api_call(offset = nil)
    puts "Appel à l'API..."
    response = RestClient.get url, headers.merge({ params: params(offset) })
    @responses << response
    JSON.parse(response.body)["value"]
  end

  def headers
    {
      'Ocp-Apim-Subscription-Key': ENV['BING_API_KEY']
    }
  end

  def params(offset = nil)
    params = {
      freshness: @freshness,
      originalImg: true
    }
    if @keyword
      params[:q] = @keyword
    end
    if offset
      params[:offset] = offset
    end
    return params
  end

  def url
    "https://api.bing.microsoft.com/v7.0/news/search"
  end
end


# GetNewsFromKeyword.new('kilian').call
