require "minitest/autorun"
require "./app/services/url_shortener.rb"

class TestUrlShortener < Minitest::Test

	def test_shorten_takes_a_url_and_returns_first_six_characters_of_sha256_hexdigest
		url = 'http://www.google.com'

		# hex digest of SHA256 hash of http://www.google.com
		expected_short_url = '253d142'

		actual_ouput = UrlShortener.shorten(url)

		assert_equal expected_short_url, actual_ouput
	end
end