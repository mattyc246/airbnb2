# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Seed Users
user = {}
user['password'] = 'abcde12345'

ActiveRecord::Base.transaction do
  20.times do 
    user['full_name'] = Faker::Name.name 
    user['email'] = Faker::Internet.email
    user['address_line1'] = Faker::Address.street_address
    user['city'] = Faker::Address.city
    user['state'] = Faker::Address.state
    user['postcode'] = Faker::Address.postcode
    user['country'] = Faker::Address.country
    user['phone_number'] = Faker::PhoneNumber.phone_number

    User.create(user)
  end
end 

# Seed Listings
listing = {}
uids = []
User.all.each { |u| uids << u.id }

ActiveRecord::Base.transaction do
  40.times do 
    listing['name'] = Faker::App.name
    listing['place_type'] = rand(1..3)
    listing['property_type'] = ["House", "Entire Floor", "Condominium", "Villa", "Townhouse", "Castle", "Treehouse", "Igloo", "Yurt", "Cave", "Chalet", "Hut", "Tent", "Other"].sample

    listing['room_number'] = rand(0..5)
    listing['bed_number'] = rand(1..6)
    listing['guest_number'] = rand(1..10)

    listing['country'] = Faker::Address.country
    listing['state'] = Faker::Address.state
    listing['city'] = Faker::Address.city
    listing['zipcode'] = Faker::Address.zip_code
    listing['address'] = Faker::Address.street_address

    listing['price'] = rand(80..500)
    listing['description'] = Faker::Hipster.sentence

    listing['user_id'] = uids.sample

    Listing.create(listing)
  end
end
