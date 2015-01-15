require 'rails_helper'

feature "User leaves a review on a listing", %q(
As an user
I want to be able to leave a review on a listing I stayed in
So that other people may benefit of my experience
Acceptance Criteria
[ ] I must be able to fill in a title
[ ] I must be able to fill a body for the review (minimum 25 characters)
[ ] I must only be able to leave a review on a place I stayed
[ ] I must be able to leave the review from the playlist show page
[ ] I am presented with errors if left either blank
[ ] I must not be able to leave a review on my own listings
) do

  let(:listing) { FactoryGirl.create(:listing) }

  scenario "user leaves a review on a listing he stayed", focus: true do
    user = listing.user

    sign_in_as(user)

    visit listing_reservation_path(user)
save_and_open_page
    fill_in "Title", with: reservation.title
    fill_in "Description", with: reservation.description

    expect(page).to have_content reservation.title
    expect(page).to have_content reservation.description

  end
end
