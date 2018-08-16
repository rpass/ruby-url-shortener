require 'sinatra'
require 'json'

require './app/models/short_url.rb'

##
# This endpoint returns the stored URL mapped to 
# the shortened URL in the path parameter
get '/:short_url' do
	short_url = params['short_url']
	
	# Normally, passing user input directly into queries
	# is dangerous and could leave you vulnerable
	# to an injection attack
	short_url = ShortUrl.find(short_url)
	
	return 404 if short_url.nil?

	url = short_url.url
	redirect url, 301
end

##
# This endpoint maps the URL in the request body
# to a shortened URL and returns a JSON response 
# including the original url and the shortened url
post '/' do
	params = JSON.parse(request.body.read)
	url = params['url']

	short_url = ShortUrl.new(url)
	
	ShortUrl.add(short_url)
	
	{
		short_url: short_url.short_url,
		url: url
	}.to_json
end 