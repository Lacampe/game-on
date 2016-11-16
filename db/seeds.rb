# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# the below will delete all resources in cloudinary - they remain cached for 30 days, so it does not free up space immediately
# Cloudinary::Api.delete_all_resources

User.destroy_all
40.times do
  url = "http://xdesktopwallpapers.com/wp-content/uploads/2012/07/Scott%20Porter%20Looking%20At%20Camera%20And%20White%20Background.jpg"
  user = User.new(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: Faker::Internet.password)
  user.save!
  user.photo_url = url
end

# seed spaces, name
Space.destroy_all


urls = [
  'http://www.courttech.biz/wp-content/uploads/02-01-01-fb04.jpg',
  'http://images.hotels4u.com/Travel_Images/Resort_118/Building_982/basic3652_AT_THE_blue_sea_club_caleta_dorada.jpg'
]

addresses = ["SW1X 8NX", "SW17 8DA", "SW11 3ES", "SW2 2QL", "SW18 3JT", "SW10 9QH", "SW15 6ST", "SW3 5HL", "SW4 7ED", "SW1A 1LY", "SW4 7UJ",
"SW4 7NH", "SW19 4YB", "SW19 1DR", "SW19 8YB", "SW18 4NL", "SW11 1AS", "SW19 2TQ", "SW8 2LE", "SW17 7BE"]

addresses.each do |address|
  space = Space.new(name: Faker::Educator.secondary_school, address: address, price_per_hour: rand(30..200), category: ["Football", "Basketball", "Tennis", "Squash"].sample, user_id: rand(1..40),
    description: "This is a nice court. Just repolished last month. Only white-soled shoes allowed. No food and drink (just water) on the court.")
  space.save!
  space.photo_urls = urls # Multi-upload happens here
end
