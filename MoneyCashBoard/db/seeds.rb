require('pry-byebug')
require('./models/tags')
require('./models/transactions')
require('./models/users')





merchant1 = Merchant.new({'name' => 'Tesco', 'amount' => 10})

merchant2 = Merchant.new({'name' =>'Subway', 'amount' => 30})

merchant1.save

transaction1 = Transaction.new({'total' => 10, 'name' => 'Food'})
transaction2 = Transaction.new({'total' => 18, 'name' => 'Petrol'})
transaction3 = Transaction.new({'total' => 48, 'name' => 'Clothing'})
transaction4 = Transaction.new({'total' => 120, 'name' => 'Bills'})


transaction1.save
transaction2.save
transaction3.save
transaction4.save

tag1 = Tags.new ({'name' => 'Shopping', 'category' => 'food'})


binding.pry

nil