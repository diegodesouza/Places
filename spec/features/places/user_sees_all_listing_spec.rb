require "rails_helper"


feature "a registered user sees all listing", %q(
As an user
I want to be able see all listings
So that i can know what listings are available for rent

Acceptance Criteria

[ ] I must be able to see all listings from index page
[ ] I must be able to navigate to a single listing
) do
  before :each do
    @user = create(:user)
    @listing = create(:listing)
    @listing1 = create(:listing)
  end

  scenario "user sees all listings", focus: true do

   sign_in_as(@user)

   visit root_path

   save_and_open_page
   expect(page).to have_content @listing.title
   expect(page).to have_content @listing1.title
  end
end
