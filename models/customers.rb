require_relative("../db/sql_runner")

class Customer

    attr_reader :id
    attr_accessor :name, :funds

    def initialize(options)
        @id = options["id"] if options["id"]
        @name = options["name"]
        @funds = options["funds"]
    end

    def save()
        sql = "INSERT INTO customers (name, funds) VALUES ($1, $2) RETURNING id;"
        values = [@name, @funds]
        @id = SqlRunner.run(sql, values)[0]["id"].to_i
    end

    def delete()
        sql = "DELETE FROM customers WHERE id = $1"
        values = [@id]
        SqlRunner.run(sql, values)
    end

    def update()
        sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3;"
        values = [@name, @funds, @id]
        SqlRunner.run(sql, values)
    end

    def self.map_items(customer_data)
        result = customer_data.map { |customer| Customer.new(customer)}
        return result
    end

    def self.all()
        sql = "SELECT * FROM customers"
        customers = SqlRunner.run(sql)
        return Customer.map_items(customers)
    end

    def self.delete_all()
        SqlRunner.run("DELETE FROM customers;")
    end

end