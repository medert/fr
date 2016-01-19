require "rails_helper"

# As an authenticated user
# I want to update an item's information
# So that I can correct errors or provide new information

feature "authenticated users can edit trip information", %{
  As an authenticated user(driver)
  I want to update an trip's information
  So that I can correct errors or provide new information
  } do

  let!(:user) { create(:user) }

  scenario "visitor signs in and views trips and navigates to edit's page" do
    trip = create_list(:trip, 3)
    sign_in_as(user)
    visit trip_path(trip.first.id)
    click_link("Update Trip")

    expect(page).to have_field('Origin', with: "#{trip.first.origin}")
    expect(page).to have_field('Destination', with: "#{trip.first.destination}")
  end

  scenario "visitor edit's trip information and submits changes" do
    trip = create_list(:trip, 3)

    visit edit_trip_path(trip.first)

    fill_in("Origin", with: "Braintree")
    fill_in("Destination", with: "Boston")
    click_button("Update Trip")

    expect(page).to have_content("Braintree")
    expect(page).to have_content("Boston")
  end
end
