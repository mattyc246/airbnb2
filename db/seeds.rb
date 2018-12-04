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
    listing['title'] = Faker::App.name
    listing['property_type'] = ["House", "Entire Floor", "Condominium", "Villa", "Townhouse", "Castle", "Treehouse", "Igloo", "Yurt", "Cave", "Chalet", "Hut", "Tent", "Other"].sample

    listing['guests'] = rand(1..15)
    listing['bedrooms'] = rand(1..5)
    listing['bathrooms'] = rand(0..4)

    listing['price_per_night'] = rand(20..999)

    listing['address_line1'] = Faker::Address.street_address
    listing['city'] = Faker::Address.city
    listing['state'] = Faker::Address.state
    listing['postcode'] = Faker::Address.postcode
    listing['country'] = Faker::Address.country
    listing['tags'] = []
    tags = ['Swimming Pool', 'Laundry', 'Beach Access', 'Wifi', 'Minibar', 'Kitchen Utensils', 'Baby Cot', 'Smoke Free', 'Toiletries', 'TV']
    rand(1..4).times do

      new_tag = tags.sample
      tag = Tag.find_by(name: new_tag)
      listing['tags'] << tag
      tags.delete(new_tag)

    end
    # listing['description'] = Faker::Hipster.sentence

    listing['user_id'] = uids.sample

    Listing.create(listing)
  end
end
