require 'minitest/autorun'
require 'rack/test'
require 'sinatra'
require './lib/app.rb'

class AppTest < MiniTest::Test
	include Rack::Test::Methods

	def app
		Sinatra::Application
	end

	def test_hello_world
		get '/'

		assert last_response.ok?
		assert_equal 'Hello World!', last_response.body
	end
end
