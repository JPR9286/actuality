class ExtractTextFromUrl

  def initialize(url)
    @url = url
  end

  def call
    puts "Appel à l'API..."
    response = RestClient.get url, headers.merge({ params: params })
    JSON.parse(response.body)["objects"][0]["text"]
  end

  def headers
    {}
  end

  def params
    {
      token: ENV['DIFFBOT_API_KEY'],
      url: @url,

    }
  end

  def url
    "https://api.diffbot.com/v3/article"
  end

end

# def summary
#   @article = Article.find(params[:id])
#   uri = URI("https://api.diffbot.com/v3/article/text")
#   params = {
#     token: 'DIFFBOT_API_KEY',
#     url: @article.source
#   }

#   uri.query = URI.encode_www_form(params)
#   res = Net::HTTP.get_response(uri)
#   data = JSON.parse(res.body)
#   article_text = data["objects"][0]["text"]

#   OpenAI.api_key = 'CHAT_GPT_API_KEY'
#   response = OpenAI::GPT3::Completion.create(
#   engine: "text-davinci-002",
#   prompt: "resume moi cette article en 15 lignes maximum: #{article_text}",
#   max_tokens: 60
# )
# @summary = response.choices.first.text.strip
# end
