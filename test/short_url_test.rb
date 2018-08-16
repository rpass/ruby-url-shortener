require "minitest/autorun"
require "./lib/short_url.rb"

class TestExample < Minitest::Test

	def test_it_can_be_initialized
		url = 'http://www.google.com'

		short_url = ShortUrl.new(url)

		refute_nil short_url
	end
end