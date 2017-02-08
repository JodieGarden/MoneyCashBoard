require( 'sinatra' )
require( 'sinatra/contrib/all' )
require('pry-byebug')
require('./models/users')
require('./models/tags')
require('./models/transactions')

get '/transactions' do
  @transactions = Transaction.all
  erb(:"transactions/index")
end

get '/transactions/new' do
  erb(:"transactions/new")
end

post '/transactions' do
  @transactions = Transaction.new(params)
  @transactions.save
  erb(:"transactions/create")
end

get '/transactions/:id' do
  @transaction = Transaction.find(params[:id])
  erb(:"transactions/show")
end

# post '/transactions/:id/delete' do 
#   Transaction.destroy(params[:id])
# redirect to(:"transactions/index")

# end