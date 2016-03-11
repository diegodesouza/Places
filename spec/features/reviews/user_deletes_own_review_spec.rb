require "rails_helper"

feature "user deletes own review", %q(
As an user
I must be able to delete my review
In case i don't want to share what I wrote anymore

  Acceptance Criteria

  [X] I must be able to delete my review
  [X] I must be prompted with a message confirming I really want to do this
  [X] I must be presented with a message I successfully deleted the review
  [X] I must not be able to delete other peoples review
) do

  scenario "user edit own review" do
    user = FactoryGirl.create(:user)
    listing = FactoryGirl.create(:listing)
    reservation = FactoryGirl.create(:reservation, listing_id: listing.id, user_id: user.id)
    review = FactoryGirl.create(:review, user_id: user.id, listing_id: listing.id )


    sign_in_as(user)

    visit listing_path(listing, reservation)

    click_on "Delete Review"
    
    expect(page).to_not have_content review.title
    expect(page).to_not have_content review.description
    expect(page).to have_content "Review successfully deleted"

  end
end
