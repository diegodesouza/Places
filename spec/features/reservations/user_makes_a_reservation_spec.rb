require 'rails_helper'

feature "a registered user makes a reservation", %q(
As an user
I want to be able to make a reservation on a listing
So that i have dates set

Acceptance Criteria
[] I must be able to specify a check_in date
[] I must be able to specify a check_out date
[] i must not be able to book a past date+time
) do

  scenario "user successfully makes a reservation with a date for check in/out", focus: true do
    user = FactoryGirl.create(:user)
    user1 = FactoryGirl.create(:user)
    listing = FactoryGirl.create(:listing, user_id: user.id)

    user = listing.user

     sign_in_as(user1)

     visit listing_path(user)

     fill_in "Check In", with: "01/30/2015"
     fill_in "Check Out", with: "05/30/2015"

     click_on "Submit"
     visit listing_reservation_path(user1)


     expect(page).to have_content "January 30, 2015"

     expect(page).to have_content "May 30, 2015"
     expect(page).to have_content "You have successfully booked this place"
# user = FactoryGirl.create(:user)
# listing = FactoryGirl.create(:listing)
# reservation = FactoryGirl.create(:reservation, listing_id: listing.id, user_id: user.id)
# review = FactoryGirl.create(:review, user_id: user.id, listing_id: listing.id )
#
# sign_in_as(user)
#
# visit listing_reservation_path(listing, reservation)
  end

  # scenario "user tries to make a reservation on an unavailable listing", focus: true do
  #   user = listing.user
  #   reservation = FactoryGirl.create(:reservation)
  #
  #   sign_in_as(user)
  #
  #   visit listing_path(user)
  #
  #   fill_in "Check In", with: reservation.check_in
  #   fill_in "Check Out", with: reservation.check_out
  #
  #   click_on "Submit"
  #
  #   expect(page).to_not have_content "January 01 2015 at 1:00 am"
  #   expect(page).to have_content "Dates are not availble at this time"
  # end
end
