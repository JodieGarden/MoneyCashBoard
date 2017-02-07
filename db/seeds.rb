require('pry-byebug')
require('./models/tags')
require('./models/transactions')
require('./models/users')





merchant1 = Merchant.new({'name' => 'Tesco', 'amount' => 10})

merchant2 = Merchant.new({'name' =>'Subway', 'amount' => 30})

merchant1.save

transaction1 = Transaction.new({'total' => 1250})

transaction1.save

tag1 = Tags.new ({'name' => 'Shopping', 'category' => 'food'})

binding.pry

nil