require 'rails_helper'

feature 'view driver profile', %{
  As an authenticated user
  I want to view reviews on driver
  So that I can find out more about driver's driving skills
  } do
  # ACCEPTANCE CRITERIA
  # * I can visit driver's profile
  # * I can read all the previous reviews in descending order

  let!(:driver) { create(:driver) }
  let!(:rider) { create(:rider) }
  let!(:trip) { create(:trip, driver_id: driver.id) }
  let!(:review) { create(:review,
                          trip_id: trip.id,
                          rider_id: rider.id,
                          driver_id: driver.id
                        )
                }

  scenario "driver views driver's reviews" do

    sign_in_as(rider)
    visit root_path
    click_link "Driver: #{trip.driver.first_name}"

    expect(page).to have_content(review.review_body)
  end

  scenario "driver views driver's reviews" do

    sign_in_as(driver)
    visit root_path
    click_link "Driver: #{trip.driver.first_name}"

    expect(page).to have_content(review.review_body)
  end
end
