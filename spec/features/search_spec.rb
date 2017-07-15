feature 'Searching projects' do
  scenario 'User can search projects by materials' do
    create_project
    visit '/'
    fill_in 'materials', with: 'paper'
    click_button 'Search'
    expect(page).to have_content('Origami crane')
  end
end
