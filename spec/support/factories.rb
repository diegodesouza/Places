require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :listing do
    sequence(:title) {|n| "title#{n} must be at least 25 char"}
    description 'This is some description about the listing'
    sequence(:number_bedroom) {|n| "#{n}"}
    street '1 Main Street'
    property_type ''
    sequence(:number_accommodate) {|n| "#{n}"}
    state ''
    country 'United States'
  end
end
