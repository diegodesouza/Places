require "rails_helper"


feature "a registered user deletes a listing", %q(
As an user
I want to be able delete a listing
So that other users don't get misled by an unavailable listing

Acceptance Criteria

[X] I must be able to delete a listing from the edit page
[X] I must be presented with a message after deleting it
) do

  before :each do
    @listing = create(:listing)
  end

  scenario "user deletes a listing" do

    sign_in_as(@listing.user)

    visit listing_path(@listing)

    click_on "Delete Listing"

    expect(page).to_not have_content @listing
    expect(page).to have_content "Your listing has been successfully deleted."
  end
end
