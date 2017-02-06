require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('./controllers/users_controllers.rb')

get '/' do
  erb( :index )
end

