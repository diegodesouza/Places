require 'rails_helper'

feature "a registered user post a listing", %q(
As a user
I want to be able to post a place for rent
so that people know i have it available

[X] I must be able to post my rental
[X] I must provide a title
[X] I must provide a description
[X] I must provide the address(st, city, state, zip, country)
[X] I must provide number of bedrooms
[ ] i must provide bed type
[ ] I must provide number of beds
[X] I must provide property type
[X] I must provide guest number
[ ] I must provide number of bathrooms
[ ] I must provide garage/driveway availability
[ ] i must provide kitchen availability
[ ] i must provide patio/backyard availability
[ ] i must provide internet availability
[ ] i must provide pets allowed
[ ] i must provide washer/dryer availability
[ ] i must provide ac/heater availability
[ ] i must provide pool availability
[ ] i must provide whether smoking if permissible
[ ] i must provide place rules
) do

    scenario "user successfully creates a listing, meeting all acceptance criteria" do

    user = create(:user)
    listing = create(:listing)

    sign_in_as(user)

    visit root_path


    click_on "Add a Place"


    fill_in "Title", with: listing.title
    fill_in "Description", with: listing.description
    fill_in "Street", with: listing.street
    fill_in "City",  with: listing.city
    select "Apartment", from: "Property Type"
    select "Connecticut", from: "State"
    select "3", from: "Number of Beds"
    select "6", from: "Accommodates"

    click_button "Create Listing"

    expect(page).to have_content "You have successfully created a listing."
    expect(page).to have_content listing.title
    expect(page).to have_content listing.description
    expect(page).to have_content listing.street
    expect(page).to have_content listing.city
    expect(page).to have_content "Apartment"
    expect(page).to have_content "3"
    expect(page).to have_content "6"
  end
end
