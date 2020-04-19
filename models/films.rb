require_relative("../db/sql_runner")

class Film

    attr_reader :id
    attr_accessor :title, :price

    def initialize(options)
        @id = options["id"] if options["id"]
        @title = options["title"]
        @price = options["price"]
    end

    def save()
        sql = "INSERT INTO films (title, price) VALUES ($1, $2) RETURNING id;"
        values = [@title, @price]
        @id = SqlRunner.run(sql, values)[0]["id"].to_i
    end

    def delete()
        sql = "DELETE FROM films WHERE id = $1;"
        values = [@id]
        SqlRunner.run(sql, values)
    end

    def update()
        sql = "UPDATE films SET (title, price) = ($1, $2) WHERE id = $3;"
        values = [@title, @price, @id]
        SqlRunner.run(sql, values)
    end

    def self.map_items(films_array)
        return films_array.map {|film| Movie.new(film)}
    end

    def self.all()
        films_array = SqlRunner.run("SELECT * FROM films;")
        return Film.map_items(film_array)
    end

    def self.delete_all()
        SqlRunner.run("DELETE FROM films;")
    end

end