require "rails_helper"


feature "a registered user deletes a listing", %q(
As an user
I want to be able delete a listing
So that other users don't get misled by an unavailable listing

Acceptance Criteria

[X] I must be able to delete a listing from the edit page
[X] I must be presented with a message after deleting it
) do

  let(:listing) { FactoryGirl.create(:listing) }

  scenario "user deletes a listing" do
    user = listing.user

    sign_in_as(user)

    visit listing_path(listing)

    click_on "Delete Listing"

    expect(page).to_not have_content listing.title
    expect(page).to have_content "Listing has been successfully deleted."
  end
end
