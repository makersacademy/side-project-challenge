feature 'Searching projects' do
  before(:each) do
    create_project
  end

  scenario 'User can search projects by materials' do
    visit '/'
    fill_in 'materials', with: 'paper'
    click_button 'Search'
    expect(page).to have_content('Origami crane')
  end
end
