feature 'Creating projects' do
  scenario 'User can create a project' do
    visit '/projects/new'
    fill_in 'title', with: 'Oragami crane'
    fill_in 'materials', with: 'paper'
    fill_in 'instructions', with: 'Fold paper'
    click_button 'Create project'
    expect(page).to have_content('Origami crane')
  end
end
