
require "spec_helper"

feature "ability to search politicians tweets" do
  scenario "user sees politwit search from" do
    visit("tweets/new")
    expect(page).to have_field("name")
    expect(page).to have_button("Submit")
  end
  end
