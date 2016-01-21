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

  let!(:user) { create(:user) }
  let!(:rider) { create(:rider) }
  let!(:driver) { create(:driver) }
  let!(:trip) { create(:trip) }

  scenario "unauthenticated user visits trips index page and views all trips" do

    visit root_path

    expect(page).to have_content "TRIPS"

    expect(page).to have_content(trip.origin)
    expect(page).to have_content(trip.destination)
    expect(page).to have_content(trip.rate)
  end

  scenario "rider visits trips index page and views all trips" do

    sign_in_as(rider)
    visit root_path

    expect(page).to have_content "TRIPS"

    expect(page).to have_content(trip.origin)
    expect(page).to have_content(trip.destination)
    expect(page).to have_content(trip.rate)
  end
end
