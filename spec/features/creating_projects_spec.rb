feature 'Creating projects' do
  scenario 'User can create a project' do
    create_project
    expect(page).to have_content('Origami crane')
  end
end
