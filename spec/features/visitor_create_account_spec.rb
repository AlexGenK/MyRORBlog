require "rails_helper"

feature "Account Creation" do

  scenario "allow acsess to Log in page" do
    visit new_user_session_path
    Capybara.ignore_hidden_elements=false
    expect(page).to have_content 'login form anchor for capybara'
    Capybara.ignore_hidden_elements=true
  end

  scenario "allow acsess to Registration page" do
    visit new_user_registration_path
    expect(page).to have_content 'Registration'
  end

  scenario "allow gest to create acount" do
    visit new_user_registration_path
    fill_in :user_username, :with => "TestUser"
    fill_in :user_email, :with => "test@mail.ts"
    fill_in :user_password, :with => "123456"
    fill_in :user_password_confirmation, :with => "123456"
    click_button "Sign up"
    expect(page).to have_content I18n.t 'devise.registrations.signed_up'
  end

end