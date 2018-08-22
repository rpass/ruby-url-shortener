require './app/services/url_shortener.rb'

class ShortUrl
  @db = {}

  attr_reader :url, :short_url

  def initialize(url)
    @url = url
    @short_url = create_short_url(@url)
  end

  def self.add(obj)
    @db[obj.short_url] = obj
  end

  def self.find(short_url)
    @db[short_url]
  end

  private

  def create_short_url(url)
    short_url = UrlShortener.shorten(url)
    return short_url unless self.class.find(short_url)

    UrlShortener.shorten(url, with_salt: true)
  end
end
