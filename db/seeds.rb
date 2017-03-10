# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'ffaker'

100.times do
  Product.create(
    name: FFaker::Product.product,
    description: FFaker::DizzleIpsum.paragraph,
    price: rand(5.0...500.0).round(2),
    remaining_quantity: rand(20...100),
    # product_image: "http://placehold.it/250x250"
    product_image: "http://lorempixel.com/300/300/fashion/"
  )
end
