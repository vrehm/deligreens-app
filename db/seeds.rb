# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.destroy_all

attributes_product = [
  {name: "orange",
  description: "De délicieuse boulle de couleur oscillant entre le rouge et le jaune. Moue au millieu, dur autour",
  stock: 22,
  price: 9,
  weight: "22",
  category: "fruits",
  variety: "agrume",
  start_season: Date.new,
  end_season: Date.new
  }
  ]

orange = Product.new(attributes_product[0])
orange.user = User.first
puts orange.valid?
orange.save
