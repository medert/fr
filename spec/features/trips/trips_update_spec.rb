require "rails_helper"

# As an authenticated user
# I want to update an item's information
# So that I can correct errors or provide new information

feature "authenticated users can edit trip information", %{
  As an authenticated user(driver)
  I want to update an trip's information
  So that I can correct errors or provide new information
  } do

  # let!(:driver) { create(:driver) }
  # let!(:trip) { create(:trip, driver_id: driver.id) }
  #
  scenario "driver views trips, navigates to edit's page" do
    driver = create(:driver)
    trip = create(:trip, driver_id: driver.id)

    visit root_path

    sign_in_as(driver)
    visit trip_path(trip)

    click_button("Edit")

    expect(page).to have_field('Origin', with: "#{trip.origin}")
    expect(page).to have_field('Destination', with: "#{trip.destination}")

  end

  scenario " driver edit's trip information and submits changes" do
    driver = create(:driver)
    trip = create(:trip, driver_id: driver.id)

    visit edit_trip_path(trip)

    fill_in("Origin", with: "Braintree")
    fill_in("Destination", with: "Boston")
    click_button("Update")

    expect(page).to have_content("You have successfully updated your question!")

    expect(page).to have_content("Braintree")
    expect(page).to have_content("Boston")
  end
end
