require( 'sinatra' )
require( 'sinatra/contrib/all' )
require('pry-byebug')
require_relative('./controllers/transactions_controllers')
require_relative('controllers/tags_controllers')
require_relative('controllers/user_controllers')



get '/' do
  erb(:index)
end
