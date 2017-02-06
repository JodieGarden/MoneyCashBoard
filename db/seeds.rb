require('pry-byebug')
require('./models/users')
require('./models/transactions')
require('./models/tags')





user1 = Users.new({'name' => 'Jodie', 'budget' => 1500})


transaction1 = Transactions.new({'original_total' => 1500, 'total' => 1250})

tag1 = Tags.new ({'name' => 'Shopping', 'category' => 'food'})

binding.pry

nil