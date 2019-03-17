require_relative("models/films.rb")
require_relative("models/customers.rb")
require_relative("models/tickets.rb")
require_relative("models/show_times.rb")

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

customer3 = Customer.new({
  'name' => 'Edward Norton',
  'funds' => '200'
  })

customer3.save

customer4 = Customer.new({
  'name' => 'James Earl Jones',
  'funds' => '600'
  })

customer4.save

film1 = Film.new({
  'title' => 'Neverending Story',
  'price' => 10,
  'showtime' => 'Matinee'
  })

film1.save
# film1.add_to_showtimes

film2 = Film.new({
  'title' => 'Neverending Story',
  'price' => 10,
  'showtime' => 'Evening'
  })

film2.save
# film2.add_to_showtimes

film3 = Film.new({
  'title' => 'Space Jam',
  'price' => 15,
  'showtime' => 'Matinee'
  })

film3.save
# film3.add_to_showtimes

  film4 = Film.new({
    'title' => 'Space Jam',
    'price' => 15,
    'showtime' => 'Evening'
    })

film4.save
# film4.add_to_showtimes

# ShowTime.add_to_showtimes

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

ticket4 = Ticket.new({
  'customer_id' => customer3.id,
  'film_id' => film3.id
  })

ticket4.save

ticket4 = Ticket.new({
  'customer_id' => customer4.id,
  'film_id' => film4.id
  })

ticket4.save

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

# p Film.matinee_count
