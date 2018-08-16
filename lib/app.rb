require 'sinatra'
require 'json'

require './lib/short_url.rb'

##
# This endpoint accepts GET requests with a path param and
# returns the long (original) url when
# supplied with a short url as a path parameter
#
# usage:
# accepts requests like GET /asdf
# returns a 301 Permanently Remove redirect response
# { short_url: 'asdf', url: 'http://www.google.com' }
get '/:short_url' do
	short_url = params[:short_url]
	url = 'http://www.google.com'
	
	redirect url, 301
end

##
# This endpoint accepts POST request body of a url and 
# returns a JSON response including 
# the original url and the shortened url
#
# accepts POST requests with JSON body
# returns JSON response with `url` and `short_url`
post '/' do
	params = JSON.parse(request.body.read)
	url = params["url"]
	short_url = ShortUrl.new(url)
	
	{
		short_url: short_url.short_url,
		url: url
	}.to_json
end 