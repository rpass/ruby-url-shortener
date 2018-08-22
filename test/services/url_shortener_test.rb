require 'minitest/autorun'
require './app/services/url_shortener.rb'

class TestUrlShortener < Minitest::Test
  def setup
    @url = 'http://www.google.com'

    # first 6 chars of hex digest of SHA256 hash of http://www.google.com
    @expected_short_url = '253d14'
  end

  def test_shorten_takes_a_url_and_returns_first_six_char_of_sha256_hexdigest
    actual_ouput = UrlShortener.shorten(@url)

    assert_equal @expected_short_url, actual_ouput
  end

  def test_that_shorten_with_salt_adds_radonmess_to_hashing_algorithm
    short_url = UrlShortener.shorten(@url, with_salt: true)

    refute_equal @expected_short_url, short_url
  end
end
