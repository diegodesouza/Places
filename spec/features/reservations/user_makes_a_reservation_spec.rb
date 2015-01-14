require 'rails_helper'

feature "a registered user makes a reservation", %q(
As an user
I want to be able to make a reservation on a listing
So that i have dates set

Acceptance Criteria
[ ] I must be able to specify a check_in date + time
[ ] I must be able to specify a check_out date + time
[ ] i must not be able to book a past date+time
) do
  let(:listing) { FactoryGirl.create(:listing) }

  scenario "user successfully makes a reservation with a date and time for check in/out", focus: true do
     user = listing.user

     sign_in_as(user)

     visit listing_path(user)

     fill_in "Check In", with: "12/12/2015, 01:00 AM"
     fill_in "Check Out", with: "12/12/2015, 01:00 AM"

     click_on "Submit"

     expect(page).to have_content "12/12/2015, 01:00 AM"
     expect(page).to have_content "12/12/2015, 01:00 AM"
     expect(page).to have_content "Your reservation was successfully created"
  end
end
