require 'rails_helper'

feature "a registered user post a listing", %q(
As a user
I want to be able to post a place for rent
so that people know i have it available

[ ] I must be able to post my rental
[ ] I must provide a title
[ ] I must provide a description
[ ] I must provide the address(st, city, state, zip, country)
[ ] I must provide number of bedrooms
[ ] i must provide bed type
[ ] I must provide number of beds
[ ] I must provide property type
[ ] I must provide guest number
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

  end
end
