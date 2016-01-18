require 'spec_helper'

require 'rails_helper'

feature 'sign up', %{
  As a prospective user
  I want to create an account
  So that I catch rides or give rides to local commuters
  } do
    # ACCEPTANCE CRITERIA
    # * I must my first and last names
    # * I must age, gender, address, city, zipcode, phone
    # * I must specify a valid email address
    # * I must specify a password, and confirm that password
    # * If I do not perform the above, I get an error message
    # * If I specify valid information, I register my account and am authenticated

  scenario 'specifying valid and required information' do
    visit root_path
    click_link 'Sign Up'
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
    binding.pry
    click_button('Sign Up')


    expect(page).to have_content("Welcome! You have signed up successfully.")
    expect(page).to have_content("Sign Out")
  end

  scenario 'required information is not supplied' do
    visit root_path
    click_link 'Sign Up'
    click_button 'Sign Up'

    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content("Sign Out")
  end

  scenario 'password confirmation does not match confirmation' do
    visit root_path
    click_link 'Sign Up'

    fill_in 'Enter Password', with: '123Seekrit'
    fill_in 'Confirm Password', with: '756Seekrit'

    click_button 'Sign Up'

    expect(page).to have_content("doesn't match")
    expect(page).to_not have_content("Sign Out")
  end
end
