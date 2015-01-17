require 'rails_helper'

feature "user searches for listings", %q(
As an user
I want to be able to search for a listing
So that I can find something more specific
Acceptance Criteria
[X] I must be able to search for a listing by the title
[X] I must be able to search for a listing by location
[X] I must be able to search for a listing by property type
    ) do

  scenario "user searches for a listing by title" do
    user = FactoryGirl.create(:user)
    listing = FactoryGirl.create(:listing, title: "Some title here")
    listing1 = FactoryGirl.create(:listing, title: "Title not in search")
    listing2 = FactoryGirl.create(:listing, title: "This either")
    listing3 = FactoryGirl.create(:listing, title: "Nor this")


    sign_in_as(user)

    visit root_path

    fill_in "Search Listings", with: "Some title here"

    click_on "Search Listings"

    expect(page).to have_link listing.title
    expect(page).to_not have_link listing1.title
    expect(page).to_not have_link listing2.title
    expect(page).to_not have_link listing3.title
  end
end
