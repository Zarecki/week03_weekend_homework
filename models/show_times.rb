require_relative("../db/sqlrunner.rb")

class ShowTime
  attr_reader :id, :film_id, :matinee_bookings, :evening_bookings

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @film_id = options['film_id']
    @matinee_bookings = options['matinee_bookings'].to_i if options['matinee_bookings']
    @evening_bookings = options['evening_bookings'].to_i if options['evening_bookings']
  end

  # def self.add_to_showtimes
  #   sql1 = "SELECT FROM films
  #          WHERE showtime = 'matinee'"
  #   result_hash1 = SqlRunner.run(sql1)
  #   result1 = Film.hash_unpack(result_hash1).length
  #   @matinee_bookings = result1
  #   sql2 = "SELECT FROM films
  #          WHERE showtime = 'evening'"
  #   result_hash2 = SqlRunner.run(sql2)
  #   result2 = Film.hash_unpack(result_hash2).length
  #   @evening_bookings = result2
  #   sql3 = "SELECT * FROM films"
  #   result_hash3 = SqlRunner.run(sql3)
  #   result3 = Film.hash_unpack(result_hash3)
  #   @film_id = result3.id
  #   sql4 = "INSERT INTO show_times (film_id, matinee, evening)
  #         VALUES ($1, $2, $3);"
  #   values = [@film_id, @matinee_bookings, @evening_bookings]
  #   SqlRunner.run(sql4, values)
  # end

end
