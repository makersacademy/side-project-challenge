

require "spec_helper"

feature "indexed politicans are successfully displayed" do
  scenario "user searchs for a tracked politician" do
    successful_search
    expect(page).to have_content("Tom Watson")
  end
  scenario "user sees politicians's most recent tweets" do
    successful_search
    expect(page).to have_
    end
  end
