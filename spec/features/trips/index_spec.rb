require "rails_helper"
#
# I want to view a list of items
# So that I can pick items to review

# TO DO : As an authenticated user

feature "users can view trips" do

  scenario "visitor signs in and views parks on index page" do
    trips = create_list(:trip, 2)
    visit root_path

    expect(page).to have_content "TRIPS"

    trips.each do |trip|
      expect(page).to have_content(trip.origin)
      expect(page).to have_content(trip.destination)
      expect(page).to have_content(trip.meet_point)
    end
  end
end
