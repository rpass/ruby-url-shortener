require 'minitest/autorun'
require 'rack/test'
require 'sinatra'
require './lib/app.rb'

require 'json'

class AppTest < MiniTest::Test
	include Rack::Test::Methods

	def app
		Sinatra::Application
	end

	def test_get_long_url_with_short_url_path_param
		get '/asdf123'

		assert_equal 301, last_response.status
		assert_equal "http://www.google.com", last_response.location
	end

	def test_post_with_url_returns_short_url_and_original_url_in_json
		example_long_url = 'http://www.google.com'

		post '/', {url: example_long_url}

		expected_response = {
			short_url: 'asdf123',
			url: example_long_url
		}.to_json

		assert last_response.ok?
		assert_equal expected_response, last_response.body
	end
end
