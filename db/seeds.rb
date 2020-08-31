# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'

Item.destroy_all

20.times do 
  item = Item.create(
    title: Faker::Creature::Cat.breed,
    description: Faker::Lorem.paragraph(sentence_count: 3),
    price:rand(5.00..100.00),
    image_url: "http://placekitten.com/#{rand(150..200)}/#{rand(150..200)}",
  )
end 