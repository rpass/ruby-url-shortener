class ShortUrl
	attr_reader :url, :short_url

	def initialize(url)
		@url = url
		@short_url = UrlShortener.shorten(@url)
	end
end