require 'rails_helper'

feature "a registered user edits a playlist", %q(
As a user
I want to be able to edit my own listing
so that i can update some features

[ ] i must be able to edit my listing from the edit page
[ ] i must be able to update some features
[ ] i must see errors
) do

  scenario "user edits own listing " do
<<<<<<< HEAD
    user = FactoryGirl.create(:user)
    listing = FactoryGirl.create(:listing)

    sign_in_as(user)

    visit new_listing_path(listing)

    click_on "Edit place"

    select "3", from: "Number of rooms"
=======

    user = FactoryGirl.create(:user)
    place = FactoryGirl.create(user_id: user.id)

    visit new_user_session_path

    click_on "Edit place"

    select "Number of rooms", with: "3"
>>>>>>> 6ef515fa13c162288670d6908ea0e9133b2ce288

    expect(page).to have_content "Listing updated sucessfully"
  end
end
