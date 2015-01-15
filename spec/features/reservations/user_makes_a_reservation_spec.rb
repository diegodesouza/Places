require 'rails_helper'

feature "a registered user makes a reservation", %q(
As an user
I want to be able to make a reservation on a listing
So that i have dates set

Acceptance Criteria
[X] I must be able to specify a check_in date + time
[X] I must be able to specify a check_out date + time
[ ] i must not be able to book a past date+time
) do
  let(:listing) { FactoryGirl.create(:listing) }

  scenario "user successfully makes a reservation with a date and time for check in/out" do
     user = listing.user

     sign_in_as(user)

     visit listing_path(user)

     fill_in "Check In", with: "12/12/2015, 01:00 AM"
     fill_in "Check Out", with: "12/12/2015, 01:00 AM"

     click_on "Submit"

     expect(page).to have_content "December 12, 2015 at 1:00 am"
     expect(page).to have_content listing.title
     expect(page).to have_content "You have successfully booked this place"
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
