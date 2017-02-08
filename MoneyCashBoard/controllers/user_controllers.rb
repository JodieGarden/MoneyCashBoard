require( 'sinatra' )
require( 'sinatra/contrib/all' )
require('pry-byebug')
require('./models/users')
require('./models/tags')
require('./models/transactions')

get '/users' do
  @merchants = Merchant.all
  erb(:"users/index")
end
