require "rails_helper"

feature "authenticated user(rider) can review a driver", %{
  As an authenticated user
  I want to review a driver
  So that I can share my ride expirience with a particular driver
  } do

  let!(:driver) { create(:driver) }
  let!(:rider) { create(:rider) }
  let!(:trip) { create(:trip, driver_id: driver.id) }
  let!(:review) {
                create(:review, trip_id: trip.id,
                rider_id: rider.id, driver_id: driver.id)
                }

  scenario "rider signs in and reviews a ride " do

    visit root_path
    sign_in_as(rider)
    visit trip_path(trip)

    expect(page).to have_content(trip.origin)
    expect(page).to have_content(trip.rate)
    expect(page).to have_content(trip.avail_cap)
    expect(page).to have_content("Driver Reviews")
    expect(page).to have_content("Rate the driver")

    select(2, from: 'Rate the driver')
    fill_in("Review", with: 'I love the driver! He was awesome!')
    expect(page).to have_button('Post Review')

    click_button("Post Review")

    expect(page).to have_content('Review posted successfully!')
    expect(page).to have_content('I love the driver! He was awesome!')
  end

  scenario "driver signs in and unable to review oneself" do

    visit root_path
    sign_in_as(driver)
    visit trip_path(trip)
    expect(page).to have_content(trip.origin)
    expect(page).to have_content(trip.rate)
    expect(page).to have_content(trip.avail_cap)
    expect(page).to have_content(review.review_body)
    expect(page).to have_content("Driver Reviews")
    expect(page).to have_content("Rating")
    expect(page).to_not have_content("Rate Driver")
    expect(page).to_not have_button("Post Review")

  end
end
