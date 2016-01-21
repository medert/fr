require "rails_helper"

feature "authorized user can delete trip information", %{
  As an authorized user(admin)
  I want to delete trip
  So that nobody can give rides on my behalf
  } do

  let!(:admin){create(:user, role: "admin")}
  let!(:driver){create(:driver)}
  let!(:rider){create(:rider)}
  let!(:trip){create(:trip, driver: driver)}

    scenario "admin navigates to show's page and deletes any trip" do

      sign_in_as(admin)
      visit root_path
      visit trip_path(trip)

      expect(page).to have_content(trip.origin)
      expect(page).to have_link(trip.driver.first_name)
      expect(page).to have_button("Delete")

      click_button("Delete")

      expect(page).to have_content("You have deleted trip successfully!")
    end

    scenario "driver navigates to show's page and deletes the trip he created" do

      sign_in_as(driver)
      visit trip_path(trip)

      expect(page).to have_content(trip.origin)
      expect(page).to have_link(trip.driver.first_name)
      expect(page).to have_button("Delete")

      click_button("Delete")

      expect(page).to have_content("You have deleted trip successfully!")
    end

    scenario "driver is unable to delete the trip he did not created" do
      trip_2 = create(:trip, driver_id: 10)

      sign_in_as(driver)
      visit trip_path(trip_2)

      expect(page).to_not have_button("Delete")
    end

    scenario "rider signs in, should be unable to delete trip" do

      sign_in_as(rider)
      visit trip_path(trip)

    expect(page).to_not have_button("Delete")
  end
end
