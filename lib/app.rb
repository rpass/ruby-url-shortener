require 'sinatra'
require 'json'

##
# This endpoint returns the long (original) url when
# supplied with a short url as a path parameter
#
# usage:
# accepts requests like GET /asdf
# returns a 301 Permanently Remove redirect response
# { short_url: 'asdf', url: 'http://www.google.com' }
get '/:short_url' do
	short_url = params[:short_url]
	short_url	
end 
