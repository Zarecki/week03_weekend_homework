require_relative("../db/sqlrunner.rb")

class Customer
  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds'].to_i
  end

def save
  sql = "INSERT INTO
  customers (name, funds)
  VALUES ($1, $2)
  RETURNING id;"
  values = [@name, @funds]
  customer = SqlRunner.run(sql, values).first
  @id = customer['id']
end

def self.display_all
  sql = "SELECT * FROM customers"
  customers = SqlRunner.run(sql)
  return Customer.hash_unpack(customers)
end

def update
  sql = "UPDATE customers
  SET (name, funds) = ($1, $2)
  WHERE id = $3"
  values = [@name, @funds, @id]
  SqlRunner.run(sql, values)
end

def delete()
    sql = "DELETE FROM customers WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def films
    sql = "SELECT films.* FROM films
          INNER JOIN tickets ON films.id = tickets.film_id
          WHERE customer_id = $1"
    values = [@id]
    films = SqlRunner.run(sql, values)
    return Film.hash_unpack(films)
  end

  def remaining_funds()
      tickets = self.films()
      tickets_cost = tickets.map{|film| film.price}
      total_cost = tickets_cost.sum
      return @funds - total_cost
    end

  def number_of_tickets
    sql = "SELECT * from tickets
          WHERE customer_id = $1"
    values = [@id]
    result_hash = SqlRunner.run(sql, values)
    result = Ticket.hash_unpack(result_hash).length
    return result
  end

def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

def self.hash_unpack(customers)
  result = customers.map { |customer| Customer.new(customer) }
  return result
end
end
