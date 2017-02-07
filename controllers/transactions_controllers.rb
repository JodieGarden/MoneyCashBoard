require( 'sinatra' )
require( 'sinatra/contrib/all' )
require('pry-byebug')
require('./models/users')
require('./models/tags')
require('./models/transactions')

get '/transactions' do
  erb(:"transactions/index")
end

post '/transactions/' do
  @transactions = Transactions.new(params)
  transaction.save
  erb(:"transactions/create")
end