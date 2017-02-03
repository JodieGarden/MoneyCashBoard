require('pry-byebug')
require('./models/users')

user1 = Users.new({'name' => 'Jodie', 'budget' => 1500})



binding.pry

nil