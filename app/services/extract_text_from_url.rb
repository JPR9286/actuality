class ExtractTextFromUrl

  def initialize(url)
    @url = url
  end

  def call
    puts "Appel à l'API..."
    # response = RestClient.get url, headers.merge({ params: params })

    response = RestClient::Request.execute(
      method: :get,
      url: url,
      timeout: 3,
      headers: headers.merge({ params: params })
    )

    parsed_response = JSON.parse(response.body)
    unless parsed_response.key?("objects")
      puts "API did not extract text"
      return nil
    end

    @article_data = parsed_response["objects"].first || {}

    # if @article_data["text"].present?
    #   category_in_french = category_translation[@article_data["categories"].first]
    #   Article.create!(title: @article_data["title"], content: @article_data["text"], category_in_french: category_in_french)
    # end




    # categories_in_english = JSON.parse(response.body)["objects"][0]["text"]["categories"]
    # categories_in_french = categories_in_english.map do |category|
    #   category_translation[category]
    # end

    # categories_in_french.each do |name|
    #   Category.create!(name: name)
    # end

    # p JSON.parse(response.body)["objects"][0]["text"]["categories"]
    {
      category: article_category,
      text: article_text
    }
  rescue RestClient::Exceptions::Timeout => e
    puts "API timed out (more than 3s to answer)"
    return nil
  end

  private

  def article_category
    categories = @article_data['categories']&.sort_by { |cat| cat["score"] }
    categories&.map do |cat|
      Category.find_by(name_en: cat['name'])
    end&.compact&.first
  end

  def article_text
    @article_data['text']
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
