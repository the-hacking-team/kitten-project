# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# To avoid sending emails during the seed ?
# FIXME: does not seem to work?
::Rails.application.config.action_mailer.perform_deliveries = false

Item.destroy_all
User.destroy_all

20.times do
  item = Item.create(
    title: Faker::Creature::Cat.breed,
    description: Faker::Lorem.paragraph(sentence_count: 3),
    price: rand(5.00..100.00),
    image_url: "http://placekitten.com/#{rand(150..200)}/#{rand(150..200)}"
  )
end

1.times do
  password = Faker::Internet.password
  first = Faker::Name.first_name
  last  = Faker::Name.last_name
  # email = "#{first}.#{last}@yopmail.com"
  email = Faker::Internet.username(specifier: "#{first} #{last}", separators: ['.']) + '@yopmail.com'
  User.create(first_name: first, last_name: last, email: email, password: password)
  puts email
end
puts "#{User.all.size} user created"

Administrator.create(email: 'admin@yopmail.com', password: 'adminpassword')
