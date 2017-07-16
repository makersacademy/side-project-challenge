feature 'Searching projects' do

  scenario 'User can search projects by material' do
    create_project
    visit '/'
    fill_in 'material_1', with: 'paper'
    click_button 'Search'
    expect(page).to have_content('Origami crane')
  end

  scenario 'User can search projects by 2 materials' do
    create_project_2
    visit '/'
    fill_in 'material_1', with: 'paper'
    fill_in 'material_2', with: 'card'
    click_button 'Search'
    expect(page).to have_content('Origami crane')
  end
end
