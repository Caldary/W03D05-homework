require_relative("../db/sql_runner")

class Ticket

    attr_accessor :customer_id, :films_id
    attr_reader :id

    def initialize(options)
        @id = options["id"] id options["id"]
        @customer_id = options["customer_id"]
        @film_id = options["film_id"]
        @price = options["price"]
    end

    def save()
        sql = "INSERT INTO tickets (customer_id, film_id, price) VALUES ($1, $2, $3) RETURNING id;"
        values = [@customer_id, @film_id, @fee]
        @id = SqlRunner.run(sql, values)[0]["id"].to_i
    end

    def delete()
        sql = "DELETE FROM tickets WHERE id = $1;"
        values = [@id]
        SqlRunner.run(sql, values)
    end

    def update()
        sql = "UPDATE tickets SET (customer_id, film_id, price) = ($1, $2, $3) WHERE id = $4;"
        values = [@customer_id, @film_id, @price, @id]
        SqlRunner.run(sql, values)
    end

    def self.map_items(tickets_array)
        return tickets_array.map {|ticket| Casting.new(ticket)}
    end

    def self.all()
        tickets_array = SqlRunner.run("SELECT * FROM tickets;")
        return Ticket.map_items(tickets_array)
    end

    def self.delete_all()
        SqlRunner.run("DELETE FROM tickets;")
    end

end