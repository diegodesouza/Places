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
[ ] i get an errors if filled incorrectly
) do

    scenario "user successfully creates a listing, meeting all acceptance criteria" do

    user = create(:user)
    listing = create(:listing)

    sign_in_as(user)

    visit root_path

    click_on "Add a Place"

    fill_in "Title", with: listing.title
    fill_in "Description", with: "Some content here"
    fill_in "Street", with: "1 Main Street"
    fill_in "City",  with: "Bridgeport"
    select "Apartment", from: "Property Type"
    select "Connecticut", from: "State"
    fill_in "Zipcode", with: "06606"
    select "3", from: "Number of Beds"
    select "6", from: "Accommodates"

    click_button "Create Listing"

    expect(page).to have_content listing.title
    expect(page).to have_content "Some content here"
    expect(page).to have_content "Apartment"
    expect(page).to have_content "3"
    expect(page).to have_content "6"
    expect(page).to have_content "1 Main Street"
    expect(page).to have_content "Bridgeport"
    expect(page).to have_content "06606"
    expect(page).to have_content "You have successfully created a listing."
  end

  scenario "user unsuccessfully creates a listing" do

    user = create(:user)

    sign_in_as(user)

    visit root_path


    click_on "Add a Place"
    click_button "Create Listing"

    expect(page).to have_content "Something went wrong try again"
    expect(page).to have_content "Title can't be blank"
    expect(page).to have_content "Description can't be blank"
    expect(page).to have_content "Street can't be blank"
    expect(page).to have_content "City can't be blank"
    expect(page).to have_content "Zipcode can't be blank"
  end
end
