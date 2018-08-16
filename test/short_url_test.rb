require "minitest/autorun"
require "./lib/short_url.rb"

class TestExample < Minitest::Test

	def test_it_can_be_initialized
		url = 'http://www.google.com'

		short_url = ShortUrl.new(url)

		refute_nil short_url
	end

	def test_url_returns_the_original_construction_argument
		url = 'http://www.google.com'

		short_url = ShortUrl.new(url)

		assert_equal url, short_url.url
	end
end