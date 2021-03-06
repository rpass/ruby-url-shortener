require 'minitest/autorun'
require 'rack/test'
require 'sinatra'
require './app.rb'

require 'json'

class AppTest < MiniTest::Test
  include Rack::Test::Methods

  def setup
    # setup the in memory collection of short urls
    @example_long_url = 'https://www.reddit.com'
    @example_short_url = '1feab9'

    post '/', { url: @example_long_url }.to_json
  end

  def app
    Sinatra::Application
  end

  def test_get_long_url_with_short_url_path_param
    get "/#{@example_short_url}"

    assert_equal 301, last_response.status
    assert_equal @example_long_url, last_response.location
  end

  def test_get_long_url_with_no_existent_short_url_returns_404_not_found
    get '/1234'

    assert_equal 404, last_response.status
  end

  def test_post_with_url_returns_short_url_and_original_url_in_json
    example_long_url = 'http://www.google.com'
    # first six chars of hex digest of SHA256 hash of http://www.google.com
    expected_short_url = '253d14'
    expected_response = {
      short_url: expected_short_url,
      url: example_long_url
    }.to_json

    post '/', { url: example_long_url }.to_json

    assert last_response.ok?
    assert_equal expected_response, last_response.body
  end
end
