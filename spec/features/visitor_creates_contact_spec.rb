require "rails_helper"

feature "Contact message" do

  scenario "allow acsess to Contacts page" do
    visit '/contacts'
    expect(page).to have_content I18n.t 'contact.add_new_mess'
  end

  scenario "allows a guest to create contact" do
    visit '/contacts'
    fill_in :contact_email, with: "no@mail.no"
    fill_in :contact_message, with: "simple message for you"
    click_button "Send message"
    expect(page).to have_content 'Thanks you!'
  end

end