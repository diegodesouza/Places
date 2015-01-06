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

    user = FactoryGirl.create(:user)
    place = FactoryGirl.create(user_id: user.id)

    visit new_user_session_path

    click_on "Edit place"

    select "Number of rooms", with: "3"

    expect(page).to have_content "Listing updated sucessfully"
  end
end
