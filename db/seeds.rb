# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# seed users, name, email, password, prof pic
User.destroy_all
20.times do
  url = Faker::Avatar.image
  user = User.new(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: Faker::Internet.password)
  user.save!
  user.photo_url = url
end

# seed spaces, name
Space.destroy_all

urls = [
  'https://aauconnect.com/wp-content/uploads/2014/05/3D-indoor-basketball-court.jpg',
  'http://willamalane.org/wp-content/uploads/2014/07/SportCourt-8.jpg'
]
8.times do
  space = Space.new(address: Faker::Address.street_address, price_per_hour: rand(30..200), category: Faker::Team.sport, user_id: rand(1..20))
  space.save!
  space.photo_urls = urls # Multi-upload happens here
end
