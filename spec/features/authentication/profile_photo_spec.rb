require "rails_helper"

feature "profile photo" do
  scenario "user uploads a profile photo" do
    visit root_path
    click_link "Sign Up"

    fill_in('First Name', with: 'John')
    fill_in('Last Name', with: 'Doe')
    fill_in('Birthdate', with: "11/11/1980")
    select('Male', from: 'Gender')
    fill_in('Address', with: '38 Baxter str')
    select('Quincy', from: 'Town')
    select('MA', from: 'State')
    fill_in('Zip', with: '02169')
    fill_in("Driver's lisence", with: '123-456-1234')
    fill_in('Phone', with: '123-456-1234')
    fill_in('Email', with: 'johndoe@123.com')
    fill_in('enter password', with: 'Seekrit123')
    fill_in('confirm password', with: 'Seekrit123')
    attach_file "Profile Photo", "#{Rails.root}/spec/support/images/photo.png"
    click_button('Sign Up')

    expect(page).to have_content("Welcome! You have signed up successfully.")
    # expect(page).to have_css("img[src*='photo.png']")
  end
end
