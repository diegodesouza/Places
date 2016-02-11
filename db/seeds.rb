# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


100.times do
  password = Faker::Internet.password

  puts "creating users..."
  User.create(
    email: Faker::Internet.email,
    password: password,
    password_confirmation: password
  )

  puts "creating listings..."
  100.times do
    Listing.create(
      title: Faker::Lorem.words.join(" "),
      description: Faker::Lorem.sentence,
      property_type: "Apartment",
      number_bedroom: Faker::Number.digit,
      number_accommodate: Faker::Number.digit,
      street: Faker::Address.street_name,
      city: Faker::Address.city,
      state: Faker::Address.state,
      zipcode: Faker::Address.zip,
      user_id: User.last.id
    )
  end

  puts "creating reservations..."
  Reservation.create(
    check_in: Faker::Date.forward(3),
    check_out: Faker::Date.forward(20),
    user_id: User.last.id,
    listing_id: Listing.last.id
  )

  puts "creating reviews..."
  Review.create(
    title: Faker::Lorem.words.join(" "),
    description: Faker::Lorem.sentence,
    user_id: User.last.id,
    listing_id: Listing.last.id,
  )
end
