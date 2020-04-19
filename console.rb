require("pry")

require_relative("models/tickets")
require_relative("models/customers")
require_relative("models/films")

Customer.delete_all()

customer1 = Customer.new({"name" => "Paulo", "funds" => 500})
customer1.save()
customer1.funds = "250"
customer1.update()


customer2 = Customer.new({"name" => "Sara", "funds" => 1000})
customer2.save()
customer3 = Customer.new({"name" => "Sienna", "funds" => 10})
customer3.save()






binding.pry
nil