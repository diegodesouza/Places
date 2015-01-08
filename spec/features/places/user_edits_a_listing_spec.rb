require 'rails_helper'

feature "a registered user edits a playlist", %q(
As a user
I want to be able to edit my own listing
so that I can update some features

[X] I must be able to edit my listing from the edit page
[X] I must be able to update some features
[ ] I must be presented with errors if I make a mistake with the form
[ ] I must not be able to edit someone else's listing
) do

  scenario "user edits own listing, meeting all acceptance criteria" do

    user = create :user
    listing = create :listing

    sign_in_as(user)

    visit listing_path(listing)

    click_on "Edit Listing"
    fill_in "Title", with: "Changed the title"

    click_on "Update Listing"

    expect(page).to have_content "Your listing has been successfully updated."
    expect(page).to have_content "Changed the title"
  end

  # scenario "user fills leaves a blank field", focus: true do
  #   user = create :user
  #   listing = create(:listing, title: " ")
  #
  #   sign_in_as(user)
  #
  #   visit edit_listing_path(listing)
  #
  #   fill_in "Title", with: listing.title
  #
  #   save_and_open_page
  #
  #   click_on "Update Listing"
  #
  #   expect(page).to have_content "Please fill out the forms correctly."
  #   expect(page).to have_content "Title can't be blank"
  #   expect(page).to have_content "Description can't be blank"
  # end
end
