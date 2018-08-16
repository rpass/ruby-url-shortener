require './lib/url_shortener.rb'

class ShortUrl
	attr_reader :url, :short_url

	def initialize(url)
		@url = url
		@short_url = UrlShortener.shorten(@url)
	end
	
	def self.add(obj)
		@@db[obj.short_url] = obj
	end

	def self.find(short_url)
		@@db[short_url]
	end

	private

	@@db = {}
end