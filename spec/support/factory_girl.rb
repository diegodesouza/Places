require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :place do
    sequence(:title) {|n| "title#{n} must be at least 25 char"}
    description 'This is some description about the listing'
    street '1 Main Street'
    city 'Boston'
    state 'MA'
    number_of_beds "3"
    property_type "Apartment"
    accomodates "6"
  end
end
