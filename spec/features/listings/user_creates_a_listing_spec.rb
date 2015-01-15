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
[X] I must provide property type
[X] I must provide guest number
[X] i get an errors if filled incorrectly
) do

  let(:user) { FactoryGirl.create(:user) }

    scenario "user successfully creates a listing, meeting all acceptance criteria" do

      sign_in_as(user)

      visit root_path

      click_on "Add a Place"

      fill_in "Title", with: "Some title here"
      fill_in "Description", with: "Some content here Some content here"
      fill_in "Street", with: "1 Main Street"
      fill_in "City",  with: "Bridgeport"
      select "Apartment", from: "Property Type"
      select "Connecticut", from: "State"
      fill_in "Zipcode", with: "06606"
      select "3", from: "Number of Bedrooms"
      select "6", from: "Accommodates"

      click_button "Create Listing"

      expect(page).to have_content "Some title here"
      expect(page).to have_content "Some content here Some content here"
      expect(page).to have_content "Apartment"
      expect(page).to have_content "3"
      expect(page).to have_content "6"
      expect(page).to have_content "1 Main Street"
      expect(page).to have_content "Bridgeport"
      expect(page).to have_content "06606"
      expect(page).to have_content "You have successfully created a listing."
    end

  scenario "user unsuccessfully creates a listing" do

    sign_in_as(user)

    visit root_path

    click_on "Add a Place"
    click_button "Create Listing"

    expect(page).to have_content "Listing wasn't created, try again!"
    expect(page).to have_content "Title can't be blank"
    expect(page).to have_content "Description can't be blank"
    expect(page).to have_content "Street can't be blank"
    expect(page).to have_content "City can't be blank"
    expect(page).to have_content "Zipcode can't be blank"
  end
end
