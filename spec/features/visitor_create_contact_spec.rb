require "rails_helper"

feature "Contact message" do
  scenario "allow acsess to Contacts page" do
    visit '/contacts'
    expect(page).to have_content 'Add new messages'
  end
end