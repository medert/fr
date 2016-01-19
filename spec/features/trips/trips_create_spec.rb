require "rails_helper"

# As an authenticated user
# I want to add an item
# So that others can review it

feature "authenticated user(driver) can create trips", %{
  As an authenticated user(driver)
  I want to create a trip
  So that i can give riders to other users
  } do

  let!(:user) { create(:user) }

  scenario "visitor signs and creates a trip" do
    sign_in_as(user)
    click_link("New Trip")
    fill_in("Origin", with: "Braintree")
    fill_in("Destination", with: "Boston")
    fill_in("Meet Point", with: "Quincy")
    fill_in("Rate", with: 10.00)
    select('Subaru', from: 'Make')
    select('Forester', from: 'Model')
    fill_in("Lisence Plates", with: 'QWERTY')
    select(2, from: 'Avaliable Seats')

    click_button("Create Trip")

    expect(page).to have_content("Braintree-Boston")
    expect(page).to have_content(user.email)
    expect(page).to have_content(10)
  end
end
