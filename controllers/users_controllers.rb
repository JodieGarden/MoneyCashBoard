require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative( '../models/users.rb' )

get '/home' do
erb(:index)
end