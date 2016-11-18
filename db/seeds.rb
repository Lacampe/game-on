# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# the below will delete all resources in cloudinary - they remain cached for 30 days, so it does not free up space immediately
# Cloudinary::Api.delete_all_resources

user_pic_array = [ "http://xdesktopwallpapers.com/wp-content/uploads/2012/07/Scott%20Porter%20Looking%20At%20Camera%20And%20White%20Background.jpg",
"https://profile.microsoft.com/RegsysProfileCenter/Images/personal_info.jpg",
"https://profile.microsoft.com/RegsysProfileCenter/Images/contact_pref.jpg",
"http://paccpronetwork.com/wp-content/uploads/2015/09/athlete.png",
"http://www.runnersworld.com/sites/runnersworld.com/files/styles/article_main_image_2200px/public/articles/2015/08/nicksymmondsbrookssinglet_1.jpg?itok=PDdyfNq_",
"https://media.aws.iaaf.org/media/Medium/b6b16b8e-68d3-453b-9191-196ac8550227.png?v=-2003354641",
"https://usatftw.files.wordpress.com/2014/10/ap_singapore_tennis__wta_finals_68191523.jpg?w=1000&h=600&crop=1",
"http://www.sportsmanias.com/images/gallery/27-100-hottest-instagram/display/81-Maggie-Vessey.jpg"]

User.destroy_all
20.times do
  url = user_pic_array.sample
  user = User.new(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: Faker::Internet.password)
  user.save!
  user.photo_url = url
end

# seed spaces, name
Space.destroy_all

basketball_urls = ["http://a57.foxnews.com/global.fncstatic.com/static/managed/img/fn2/feeds/Misc/2016/10/19/876/493/Indoor-Basketball-Court-2-4bd960811bed7510VgnVCM100000d7c1a8c0____.jpg?ve=1&tl=1",
  "http://leulymedia.s3.amazonaws.com/sportcourt/2014/3/635306798315425989/b6100.jpg",
  "http://myzone.homesoftherich.netdna-cdn.com/wp-content/uploads/2014/10/Screen-Shot-2014-10-13-at-7.20.25-AM.png",
  "https://s-media-cache-ak0.pinimg.com/originals/79/67/ce/7967ce46d1fbf767a0c0df5b7aacacb5.jpg",
  "http://rdcnewscdn.realtor.com/wp-content/uploads/2016/10/Indoor-Basketball-Court-6.jpg",
  "http://myzone.homesoftherich.netdna-cdn.com/wp-content/uploads/2014/12/Screen-Shot-2014-12-15-at-2.32.06-AM.png",
  "http://myzone.homesoftherich.netdna-cdn.com/wp-content/uploads/2012/01/381854_10150415364354792_74914304791_7856367_739196412_n1.jpeg"

]

squash_urls = [
  'http://www.courttech.biz/wp-content/uploads/02-01-01-fb04.jpg',
  'http://images.hotels4u.com/Travel_Images/Resort_118/Building_982/basic3652_AT_THE_blue_sea_club_caleta_dorada.jpg',
  'http://www.harrabin.net/perch/resources/squash-court-6-w600h400.jpg',
  "http://www.harrogatesfc.co.uk/wp-content/uploads/2014/09/HSFCSquashcourt.jpg",
  "http://asbsquash.de/images/System-100_Titel.jpg",
  "http://www.crscourts.com/images/squash01.jpg",
  "http://www.courtcraft.co.uk/wp-content/uploads/2013/04/gallery37_large.jpg"
]

football_urls = [
  "http://seattlerats.org/wp-content/uploads/2015/03/Soccer-Field-Night1.jpg",
  "http://www.littlegiantathletics.com/wp-content/uploads/2015/08/Soccer-3.jpg",
  "http://www.sportsandsafetysurfaces.co.uk/wp-content/uploads/2015/01/3G-Sports-Pitch.jpg",
  "http://www.thesoccerstore.co.uk/blog/wp-content/uploads/2015/11/artificial-football-pitch.jpg",
  "https://www.cardenpark.co.uk/wp-content/uploads/2014/12/Carden-Park-football-pitch-corner.jpg",
  "http://www.kestrelcontractors.co.uk/wp-content/uploads/2014/08/60x40m-3G-football-pitch.jpg"
]

tennis_urls = [
  "https://zainotenniscourts.files.wordpress.com/2011/01/dsc_0039.jpg",
  "http://www.simonslandscaping.co.uk/wp-content/uploads/2016/02/Tennis_Courts_09_big.jpg",
  "http://chaserubin.net/wp-content/uploads/chaserubin-net/sites/359/tennis-courts.jpg",
  "http://rbfacilities.byu.edu/images/upload/cbdda918b0f4f78e0e845251f1c364bcef227514.jpeg",
  "http://www.stmworld.co.uk/wp-content/uploads/2016/05/tennis-court-maintenance-Gisborough-Hall-tennis-court.jpg",
  "http://www.sportsandsafetysurfaces.co.uk/wp-content/uploads/2015/02/Tennis-Court-Painting-Process.jpg",
  "http://femininrascal.com/wp-content/uploads/2015/07/grass-tennis-courts.jpg"
]

london_addresses = ["SW1X 8NX", "SW17 8DA", "SW11 3ES", "SW2 2QL", "SW18 3JT", "SW10 9QH", "SW15 6ST", "SW3 5HL", "SW4 7ED", "SW1A 1LY", "SW4 7UJ",
"SW4 7NH", "SW19 4YB", "SW19 1DR", "SW19 8YB", "SW18 4NL", "SW11 1AS", "SW19 2TQ", "SW8 2LE", "SW17 7BE"]

london_addresses.each do |address|
  space = Space.new(name: Faker::Educator.secondary_school, address: address, price_per_hour: rand(30..200), category: ["Football", "Basketball", "Tennis", "Squash"].sample, user_id: rand(1..15),
    description: "This is a nice court. Just repolished last month. Only white-soled shoes allowed. No food and drink (just water) on the court.")
  space.save!
  case space.category
  when "Basketball"
    space.photo_urls = basketball_urls.sample(2)
  when "Football"
    space.photo_urls = football_urls.sample(2)
    space.description = "Well sodden grass"
    space.save
  when "Tennis"
    space.photo_urls = tennis_urls.sample(2)
  when "Squash"
    space.photo_urls = squash_urls.sample(2)
  end
end

bristol_addresses = ["BS37 7YL", "BS8 4AZ", "BS8 4AZ", "BS8 4AZ", "BS8 4AZ", "BS7 8RA", "BS4 5EQ", "BS23 4BY", "BS15 4EE"]

bristol_addresses.each do |address|
  space = Space.new(name: Faker::Educator.secondary_school, address: address, price_per_hour: rand(30..200), category: ["Football", "Basketball", "Tennis", "Squash"].sample, user_id: rand(1..15),
    description: "This is a nice court. Just repolished last month. Only white-soled shoes allowed. No food and drink (just water) on the court.")
  space.save!
  case space.category
  when "Basketball"
    space.photo_urls = basketball_urls.sample(2)
  when "Football"
    space.photo_urls = football_urls.sample(2)
    space.description = "Well sodden grass"
    space.save
  when "Tennis"
    space.photo_urls = tennis_urls.sample(2)
  when "Squash"
    space.photo_urls = squash_urls.sample(2)
  end
end

cambridge_addresses = ["CB7 5XU", "CB9 9EE", "CB21 4DS", "CB8 0BJ", "CB5 8PP", "CB2 9JW", "CB4 1QA", "CB4 1FS", "CB4 3HG", "CB2 1XB"]
cambridge_addresses.each do |address|
  space = Space.new(name: Faker::Educator.secondary_school, address: address, price_per_hour: rand(30..200), category: ["Football", "Basketball", "Tennis", "Squash"].sample, user_id: rand(1..15),
    description: "This is a nice court. Just repolished last month. Only white-soled shoes allowed. No food and drink (just water) on the court.")
  space.save!
  case space.category
  when "Basketball"
    space.photo_urls = basketball_urls.sample(2)
  when "Football"
    space.photo_urls = football_urls.sample(2)
    space.description = "Well sodden grass"
    space.save
  when "Tennis"
    space.photo_urls = tennis_urls.sample(2)
  when "Squash"
    space.photo_urls = squash_urls.sample(2)
  end
end

