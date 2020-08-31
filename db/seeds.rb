# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Pour ne pas envoyer des mails lors de la génération de ma DB
::Rails.application.config.action_mailer.perform_deliveries = false
config.action_mailer.perform_deliveries = true
# Version française !
Faker::Config.locale = 'fr'

Item.destroy_all
User.destroy_all

20.times do 
  item = Item.create(
    title: Faker::Creature::Cat.breed,
    description: Faker::Lorem.paragraph(sentence_count: 3),
    price:rand(5.00..100.00),
    image_url: "http://placekitten.com/#{rand(150..200)}/#{rand(150..200)}",
  )
end 

puts "Création des Users :"
2.times do
  password = Faker::Internet.password
  first = Faker::Name.first_name
  last  = Faker::Name.last_name
  email = "#{first}.#{last}@yopmail.com"

  User.create(email: email, password: password, description: Faker::Lorem.sentences(number: 10).join(' '), first_name: first, last_name: last)
end