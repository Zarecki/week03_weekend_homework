require_relative("../db/sqlrunner.rb")

class Film
  attr_reader :id, :showtime
  attr_accessor :title, :price

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @price = options['price'].to_i
    @showtime = options['showtime']
  end

  def save
    sql = "INSERT INTO
    films (title, price)
    VALUES ($1, $2)
    RETURNING id;"
    values = [@title, @price]
    film = SqlRunner.run(sql, values).first
    @id = film['id']
  end

  def self.display_all
    sql = "SELECT * FROM films"
    films = SqlRunner.run(sql)
    return Film.hash_unpack(films)
  end

  def update
    sql = "UPDATE films
    SET (title, price) = ($1, $2)
    WHERE id = $3"
    values = [@title, @price, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM films WHERE title = $1"
    values = [@title]
    SqlRunner.run(sql, values)
  end

  def customers
    sql = "SELECT customers.* FROM customers
          INNER JOIN tickets ON customers.id = tickets.customer_id
          WHERE film_id = $1"
    values = [@id]
    customers = SqlRunner.run(sql, values)
    return Customer.hash_unpack(customers)
  end

  def audience_size
    sql = "SELECT * from tickets
          WHERE film_id = $1"
    values = [@id]
    result_hash = SqlRunner.run(sql, values)
    result = Ticket.hash_unpack(result_hash).length
    return result
  end

  # def self.matinee_count
  #   sql = "SELECT SUM(matinee)
  #         FROM films"
  #   # value = [@matinee]
  #   result = SqlRunner.run(sql)
  #   return result
  # end

  # def self.evening_count
  #   sql = "SELECT SUM(evening)
  #         FROM films"
  #   # value = [@matinee]
  #   result = SqlRunner.run(sql)
  #   return result
  # end

  # def self.add_to_showtimes
  #   sql1 = "SELECT FROM films
  #          WHERE $1 = 'matinee'"
  #   values1 = [@showtime]
  #   result_hash = SqlRunner.run(sql, values)
  #   result = Film.hash_unpack(result_hash).length
  #   @matinee = result
  #
  #   sql = "INSERT INTO show_times (film_id, matinee, evening)
  #         VALUES ($1, $2, $3);
  #         "
  #   values = [@id, @matinee.sum, @evening.sum]
  #   SqlRunner.run(sql, values)
  # end

  def self.delete_all()
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

  def self.hash_unpack(films)
    result = films.map { |film| Film.new(film) }
    return result
  end

end
