require "rails_helper"

RSpec.feature "Organisation management" do
  let!(:search_word) {SearchWord.create(search_word: "film")}
  let!(:category) {Category.create(name: "Human_rights")}

  scenario "Admin creates new organisation" do
    puts category
    puts category.name
    visit new_organisation_path
    fill_in "Name", with: "Test org"
    fill_in "Subheading", with: "Test org"
    fill_in "Email", with: "test@test.com"
    fill_in "Description", with: "Org description"
    check_checkbox(search_word.search_word)
    check_checkbox(category.name)
    attach_file "././app/assets/images/logos/thewhy.png"
    click_button "Create organisation"
  end
end
