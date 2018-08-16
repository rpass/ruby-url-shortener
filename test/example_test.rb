require "minitest/autorun"
require "./lib/example.rb"

class TestExample < Minitest::Test

	def setup
		@name = 'example'
	end

	def test_it_speaks
		assert_equal 'example', Example.new(@name).speak
	end
end