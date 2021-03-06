require 'minitest/autorun'
require './app/models/short_url.rb'

class TestShortUrl < Minitest::Test
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

  def test_short_url_returns_the_shortened_url
    url = 'http://www.google.com'
    expected_short_url = 'asdf123'

    # Since ShortUrl relies on UrlShortener for the shortening logic,
    # we want to stub UrlShortener to return a canned response so that
    # this test does not fail when we change the logic of UrlShortener.shorten
    UrlShortener.stub :shorten, expected_short_url do
      short_url = ShortUrl.new(url)

      assert_equal expected_short_url, short_url.short_url
    end
  end

  def test_that_add_and_find_keep_track_of_in_memory_short_urls
    short_urls = [
      ShortUrl.new('http://www.google.com'),
      ShortUrl.new('https://news.ycombinator.com/'),
      ShortUrl.new('https://www.reddit.com/')
    ]

    short_urls.each do |short_url|
      ShortUrl.add(short_url)

      assert_equal short_url, ShortUrl.find(short_url.short_url)
    end
  end

  ##
  # When adding a new ShortUrl to our in-memory collection will
  # create a key collision, the new ShortUrl recalculates its
  # short_url until it finds a unique short_url
  def test_that_new_will_recover_from_a_key_collision
    first_short_url = ShortUrl.new('https://www.google.com')
    ShortUrl.add(first_short_url)

    second_short_url = ShortUrl.new('https://www.google.com')

    refute_equal first_short_url.short_url, second_short_url.short_url
  end

  def test_that_find_returns_nil_when_no_short_url_object_matches_the_short_url
    assert_nil ShortUrl.find('123')
  end
end
