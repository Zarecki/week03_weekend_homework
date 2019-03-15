require_relative("models/films.rb")
require_relative("models/customers.rb")
require_relative("models/tickets.rb")

require("pry-byebug")

Ticket.delete_all
Customer.delete_all
Film.delete_all

customer1 = Customer.new({
  'name' => 'Al Pacino',
  'funds' => '500'
  })

customer1.save

customer2 = Customer.new({
  'name' => 'Jackie Chan',
  'funds' => '100'
  })

customer2.save

film1 = Film.new({
  'title' => 'Neverending Story',
  'price' => 10
  })

film1.save

film2 = Film.new({
  'title' => 'Space Jam',
  'price' => 15
  })

film2.save

ticket1 = Ticket.new({
  'customer_id' => customer1.id,
  'film_id' => film1.id
  })

ticket1.save

ticket2 = Ticket.new({
  'customer_id' => customer2.id,
  'film_id' => film1.id
  })

ticket2.save

 ticket3 = Ticket.new({
   'customer_id' => customer2.id,
   'film_id' => film2.id
   })

ticket3.save

# p Customer.display_all
# p Film.display_all
# p Ticket.display_all

# customer1.name = 'Al Pachinko'
# customer1.update

# customer1.delete
# film1.delete
# ticket1.delete

# p customer2.films
# p film1.customers

# p customer2.remaining_funds
# p customer2.number_of_tickets
# p film2.audience_size
