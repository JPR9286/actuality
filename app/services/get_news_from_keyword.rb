require 'news-api'


class GetNewsFromKeyword
  def initialize(keyword:, since: Date.today)
    @keyword = keyword
    @news_api = News.new(ENV['NEWS_API_KEY'])
    @since = since
  end

  def call
    @news_api.get_everything(
      q: @keyword,
      from: @since.to_s,
      sortBy: "popularity",
      language: 'fr'
    )
  end

  private

  def from
    today = Date.today.to_s
    since = @since.to_s
    "#{since}&to=#{today}"
  end
end


GetNewsFromKeyword.new('kilian').call
