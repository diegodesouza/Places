require 'rails_helper'

feature "a registered user post a listing", %q(
As a user
I want to be able to post a place for rent
so that people know i have it available

<<<<<<< HEAD
[X] I must be able to post my rental
[X] I must provide a title
[X] I must provide a description
[X] I must provide the address(st, city, state, zip, country)
[X] I must provide number of bedrooms
[ ] i must provide bed type
[ ] I must provide number of beds
[X] I must provide property type
[X] I must provide guest number
=======
[ ] I must be able to post my rental
[ ] I must provide a title
[ ] I must provide a description
[ ] I must provide the address(st, city, state, zip, country)
[ ] I must provide number of bedrooms
[ ] i must provide bed type
[ ] I must provide number of beds
[ ] I must provide property type
[ ] I must provide guest number
>>>>>>> 6ef515fa13c162288670d6908ea0e9133b2ce288
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

<<<<<<< HEAD
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
=======
      user = FactoryGirl.create(:user)
      place = FactoryGirl.create(user_id: user.id)

      visit new_user_session_path


      click_link "Add a place"

      fill_in "Title", with: place.title
      fill_in "Description", with: place.description
      fill_in "Street", with: place.street
      select "Boston",  from: "City"
      select "MA", from:"State"
      select "3", from: "Number of beds"
      select "Apartment", from: "Property type"
      select "6", from: "Accomodates"
      
      click_button "Submit Playlist"

      expect(page).to have_content "Your place has been successfully created."
      expect(page).to have_content place.title
      expect(page).to have_content place.description
      expect(page).to have_content playlist.user.name

>>>>>>> 6ef515fa13c162288670d6908ea0e9133b2ce288
  end
end
