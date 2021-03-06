# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create!(name: "food")
Category.create!(name: "book")
Category.create!(name: "beer")

50.times do
  name = Faker::Food.dish
  desc = "This is a description"
  unit_price = rand(50)
  category_id = 1

  Product.create!(name: name,
                  desc: desc,
                  unit_price: unit_price,
                  category_id: category_id)
end

50.times do
  name = Faker::Book.title
  desc = Faker::Book.author 
  unit_price = rand(50)
  category_id = 2

  Product.create!(name: name,
                  desc: desc,
                  unit_price: unit_price,
                  category_id: category_id)
end

50.times do
  name = Faker::Beer.name
  desc = Faker::Beer.style
  unit_price = rand(50)
  category_id = 3

  Product.create!(name: name,
                  desc: desc,
                  unit_price: unit_price,
                  category_id: category_id)
end

User.create!(name:  'Nam Pham',
             email: 'nampham@bu.edu',
             password:              'foobar',
             password_confirmation: 'foobar')
