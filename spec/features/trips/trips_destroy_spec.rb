require "rails_helper"

feature "authorized user can delete trip information", %{
  As an authorized user(admin)
  I want to delete trip
  So that nobody can give rides on my behalf
  } do

  let(:trip) { create :trip }
  let(:admin) { create :user, role: "admin" }
  let(:user) { create :user, role: "member" }

  scenario "admin signs in, navigates to edit's page and deletes trip" do
    sign_in_as(admin)
    visit trip_path(trip)
    click_link("Delete")

    expect(page).to have_content("You have deleted trip successfully!")
  end

  scenario "member signs in, should be unable to delete trip" do
    sign_in_as(user)
    visit trip_path(trip)

    expect(page).to_not have_content("Delete")
  end
end
