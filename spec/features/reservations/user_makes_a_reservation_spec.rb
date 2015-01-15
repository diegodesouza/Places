require 'rails_helper'

feature "a registered user makes a reservation", %q(
As an user
I want to be able to make a reservation on a listing
So that i have dates set

Acceptance Criteria
[X] I must be able to specify a check_in date
[X] I must be able to specify a check_out date
[X] i must not be able to book a past date+time
) do

  scenario "user successfully makes a reservation with a date and time for check in/out" do
     user = create :user
     user1 = create :listing
     reservation = create :reservation

     sign_in_as(user)

     visit listing_path(user1)

     fill_in "Check In", with: reservation.check_in
     fill_in "Check Out", with: reservation.check_out

     click_on "Submit"

     redirect_to listing_path(reservation.user)

     expect(page).to have_content "January 10, 2015"
     expect(page).to have_content "May 10, 2015"
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
