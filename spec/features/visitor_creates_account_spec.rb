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
    sign_up  
    expect(page).to have_content I18n.t 'devise.registrations.signed_up'
  end

end