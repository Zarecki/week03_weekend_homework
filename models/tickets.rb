require_relative("../db/sqlrunner.rb")

class Ticket
  attr_reader :id, :customer_id, :film_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
  end

  def save
    sql = "INSERT INTO
    tickets (customer_id, film_id)
    VALUES ($1, $2)
    RETURNING id;"
    values = [@customer_id, @film_id]
    ticket = SqlRunner.run(sql, values).first
    @id = ticket['id']
  end

  def self.display_all
    sql = "SELECT * FROM tickets"
    tickets = SqlRunner.run(sql)
    return Ticket.hash_unpack(tickets)
  end

  def update
    sql = "UPDATE tickets
    SET (customer_id, film_id) = ($1, $2)
    WHERE id = $3"
    values = [@customer_id, @film_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM tickets WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end


  def self.delete_all()
      sql = "DELETE FROM tickets"
      SqlRunner.run(sql)
    end

  def self.hash_unpack(tickets)
    result = tickets.map { |ticket| Ticket.new(ticket) }
    return result
  end

end
