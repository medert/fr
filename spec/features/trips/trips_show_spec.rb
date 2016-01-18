require "rails_helper"
#
# As an authenticated user
# I want to view a list of items
# So that I can pick items to review

feature "authenticated users can view trips" do

  scenario "visitor signs in and views trips on index page" do
    trips = create_list(:trip, 3)
    visit root_path

    expect(page).to have_content "TRIPS"

    trips.each do |trip|
      visit trip_path(trip)

      expect(page).to have_content(trip.origin)
      expect(page).to have_content(trip.destination)
    end
  end

  scenario "visitor signs in and views trips on index page" do
    trip = create(:trip)
    visit root_path

    expect(page).to have_content "TRIPS"

    visit trip_path(trip)

    expect(page).to have_content(trip.origin)
    expect(page).to have_content(trip.destination)
  end
end
