require( 'sinatra' )
require( 'sinatra/contrib/all' )
require('pry-byebug')
require('./models/users')
require('./models/tags')
require('./models/transactions')

get '/tags' do
  erb(:"tags/index")
end