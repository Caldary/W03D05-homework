require("pry")

require_relative("models/tickets")
require_relative("models/customers")
require_relative("models/films")

Customer.delete_all()
Film.delete_all()
Ticket.delete_all()

customer1 = Customer.new({"name" => "Paulo", "funds" => 500})
customer1.save()
customer1.funds = 250
customer1.update()


customer2 = Customer.new({"name" => "Sara", "funds" => 1000})
customer2.save()
customer3 = Customer.new({"name" => "Sienna", "funds" => 10})
customer3.save()

film1 = Film.new({"title" => "The Joker", "price" => 10})
film1.save()
film1.price = 5
film1.update()

film2 = Film.new({"title" => "The Godfather", "price" => 15})
film2.save()

ticket1 = Ticket.new({"customer_id" => customer1.id, "film_id" => film1.id, "price" => 10})
ticket1.save()




binding.pry
nil