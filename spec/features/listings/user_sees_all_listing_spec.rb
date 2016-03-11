require "rails_helper"


feature "a registered user sees all listing", %q(
As an user
I want to be able see all listings
So that i can know what listings are available for rent

Acceptance Criteria

[X] I must be able to see all listings from index page
[X] I must be able to navigate to a single listing
) do
  
  before :each do
    @user = create(:user)
    @listing = create(:listing)
    @listing1 = create(:listing)
  end

  scenario "user sees all listings" do

   sign_in_as(@user)

   visit root_path

   expect(page).to have_content @listing.title
   expect(page).to have_content @listing1.title
  end

  scenario "user navigates to show page" do

    sign_in_as(@user)

    visit root_path

    click_on @listing.title

    current_path.should == listing_path(@listing)
  end
end
