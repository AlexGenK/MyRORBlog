require "rails_helper"

feature "Article Creation" do

  # выяснить с database_cleaner!!!

  # before(:all) do
  #   sign_up
  # end

  scenario "allow user acsess to Add new article page" do
    sign_up
    visit new_article_path  
    expect(page).to have_content 'Add new article'
  end

end