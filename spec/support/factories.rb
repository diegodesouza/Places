require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :listing do
    sequence(:title) {|n| "title#{n} must be at least 5 char"}
    description 'This is some description about the listing'
    property_type 'Apartment'
    sequence(:number_bedroom) {|n| "#{n}"}
    sequence(:number_accommodate) {|n| "#{n}"}
    street '1 Main Street'
    city "Bridgeport"
    state 'Connecticut'
    zipcode '06606'
    country 'United States'

    user
  end

  factory :reservation do
    check_in "02/01/2015, 01:00 AM"
    check_out "02/10/2015, 01:00 AM"

    user
    listing
  end
end
