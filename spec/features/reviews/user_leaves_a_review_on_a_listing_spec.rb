require 'rails_helper'

feature "User leaves a review on a listing", %q(
As an user
I want to be able to leave a review on a listing I stayed in
So that other people may benefit of my experience
Acceptance Criteria
[X] I must be able to fill in a title
[X] I must be able to fill a body for the review (minimum 25 characters)
[X] I must only be able to leave a review on a place I stayed
[X] I must be able to leave the review off the listing's reservation page
[X] I am presented with errors if fields left blank
) do

  scenario "user leaves a review on a reservation he made" do
    user = FactoryGirl.create(:user)
    listing = FactoryGirl.create(:listing)
    reservation = FactoryGirl.create(:reservation, listing_id: listing.id, user_id: user.id)
    review = FactoryGirl.create(:review, user_id: user.id, listing_id: listing.id )

    sign_in_as(user)

    visit listing_reservation_path(listing, reservation)

    fill_in "Title", with: review.title
    fill_in "Description", with: review.description

    click_on "Submit Review"

    redirect_to listing_path(listing)

    expect(page).to have_content review.title
    expect(page).to have_content review.description
  end

  scenario "user is presented with errors if fields left blank" do
    user = FactoryGirl.create(:user)
    listing = FactoryGirl.create(:listing)
    reservation = FactoryGirl.create(:reservation, listing_id: listing.id, user_id: user.id)
    review = FactoryGirl.create(:review, user_id: user.id, listing_id: listing.id )

    sign_in_as(user)

    visit listing_reservation_path(listing, reservation)

    click_on "Submit Review"

    redirect_to listing_path(listing)

    expect(page).to_not have_content review.title
    expect(page).to_not have_content review.description
    expect(page).to have_content "Review wasn't created, try again!"
  end
end
