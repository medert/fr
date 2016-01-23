require "rails_helper"

feature "authenticated users can view trips", %{
  As an authenticated user
  I want to view a list of trips
  So that I can pick trip to see additional information
  } do

  let!(:user) { create(:user) }
  let!(:rider) { create(:rider) }
  let!(:driver) { create(:driver) }
  let!(:trip) { create(:trip, driver: driver) }

  scenario "visitor signs in and views trips on index page" do
    visit root_path
    visit trip_path(trip)

    expect(page).to have_content(trip.origin)
    expect(page).to have_content(trip.destination)
    expect(page).to have_content(trip.driver.first_name)
    expect(page).to have_content(trip.driver.last_name)
    expect(page).to have_content(trip.driver.rating)
    expect(page).not_to have_content(trip.meet_point)
    expect(page).not_to have_content(trip.car_make)
    expect(page).not_to have_content(trip.car_model)
    expect(page).not_to have_content(trip.car_plate)
  end

  scenario "rider signs in and views trips on index page" do
    visit root_path
    sign_in_as(rider)
    visit trip_path(trip)

    expect(page).to have_content(trip.meet_point)
    expect(page).to have_content(trip.car_make)
    expect(page).to have_content(trip.car_model)
    expect(page).to have_content(trip.car_plate)
  end

  scenario "driver signs in and views trips on show page" do
    visit root_path
    sign_in_as(driver)
    visit trip_path(trip)

    expect(page).to have_button("Edit")
    expect(page).to have_button("Delete")
    expect(page).to_not have_content("Review the Driver")
  end
end
