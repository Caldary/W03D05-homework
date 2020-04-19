require("pry")

require_relative("models/tickets")
require_relative("models/customers")
require_relative("models/films")

customer1 = Customer.new({"name" => "Paulo", "funds" => 500})
customer1.save()