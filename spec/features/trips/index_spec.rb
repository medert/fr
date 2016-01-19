require "rails_helper"

feature "users can view all avaliable trips", %{
  As an unauthenticated user (rider)
  I want to view all avaliable trips
  So that I catch a trip i am interested
  } do
  # ACCEPTANCE CRITERIA
  # * I can visit trips index page and see all avaliable trips
  # * I can see name of the page "TRIPS"
  # * I can see driver's first name and last_name

  scenario "unauthenticated user visits trips index page and views all trips" do
    trips = create_list(:trip, 3)
    visit root_path

    expect(page).to have_content "TRIPS"

    trips.each do |trip|
      expect(page).to have_content(trip.origin)
      expect(page).to have_content(trip.destination)
      expect(page).to have_content(trip.rate)
      expect(page).to_not have_content(trip.meet_point)
      expect(page).not_to have_content(trip.car_make)
      expect(page).not_to have_content(trip.car_plate)
    end
  end
end
