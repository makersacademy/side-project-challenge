


require "spec_helper"

feature "notification of a failed search" do
  scenario "user enters non-politician" do
    visit "tweets/new"
    fill_in "name", with: "anon"
    click_on("Submit")
    expect(page).to have_content("Your search didn't match")
  end
  end
