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
  before :each do
    @listing = create(:listing)
  end

  scenario "user successfully makes a reservation with a date and time for check in/out" do

     sign_in_as(@listing.user)

     visit listing_reservation_path

     select "Feb 01, 2015", from: "Check_in"
     select "Feb 02, 2015", from: "Check_out"

     click_on "Submit"

     expect(page).to have_content "Feb 01, 2015"
     expect(page).to have_content "Your reservation was successfully created"
  end
end
