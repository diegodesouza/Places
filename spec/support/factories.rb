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
    check_in "30/01/2015"
    check_out "30/05/2015"

    user
    listing
  end

  factory :review do
    title "This is a review title"
    description "This is a description for a review"
  end
end
