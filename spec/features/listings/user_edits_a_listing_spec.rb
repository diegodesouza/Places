require 'rails_helper'

feature "a registered user edits a listing", %q(
As a user
I want to be able to edit my own listing
so that I can update some features

[X] I must be able to edit my listing from the edit page
[X] I must be able to update some features
[X] I must be presented with errors if I make a mistake with the form
) do

  let(:listing) { FactoryGirl.create(:listing) }

  scenario "user edits own listing, meeting all acceptance criteria" do
    user = listing.user

    sign_in_as(user)

    visit listing_path(listing)

    click_on "Edit Listing"
    fill_in "Title", with: "Changed the title"

    click_on "Update Listing"

    expect(page).to have_content "Listing has been successfully updated."
    expect(page).to have_content "Changed the title"
  end
end
