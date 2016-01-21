# # require "rails_helper"
#
# feature "authenticated user(rider) can review driver", %{
#   As an authenticated user
#   I want to review a driver
#   So that I can share my ride expirience with a particular driver
#   } do
#
#   scenario "visitor signs in and reviews driver" do
#     rider = create(:rider)
#     trip = create(:trip)
#
#     visit root_path
#     sign_in_as(rider)
#     visit trip_path(trip)
#
#     expect(page).to have_content(trip.origin)
#     expect(page).to have_content(trip.rate)
#     expect(page).to have_content(trip.avail_cap)
#     expect(page).to have_content("Review Driver")
#     expect(page).to have_content("Rate the driver")
#
#     select(2, from: 'Rate the driver')
#     fill_in("Review", with: 'I love the driver! He was awesome!')
#     expect(page).to have_button('Post Review')
#     click_button ("Post Review")
#
#     expect(page).to have_button('You posted review successfully!')
#
#   end
# end
