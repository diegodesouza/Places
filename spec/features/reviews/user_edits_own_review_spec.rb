require "rails_helper"

feature "user edits own review", %q(
As an user
I want to be able to edit my own review
So that people can get an accurate feedback from my experience

Acceptance Criteria

[X] I must be able to edit my own review
[X] I am presented with messages review successfully updated
) do

  scenario "user edit own review" do
    user = FactoryGirl.create(:user)
    listing = FactoryGirl.create(:listing)
    reservation = FactoryGirl.create(:reservation, listing_id: listing.id, user_id: user.id)
    review = FactoryGirl.create(:review, user_id: user.id, listing_id: listing.id )


    sign_in_as(user)

    visit listing_path(listing, reservation)
    click_on "Edit Review"

    fill_in "Title", with: review.title
    fill_in "Description", with: review.description

    click_on "Update Review"

    expect(page).to have_content review.title
    expect(page).to have_content review.description
    expect(page).to have_content "Review successfully updated"

  end
end
