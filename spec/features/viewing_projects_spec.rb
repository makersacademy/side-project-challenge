feature 'Viewing projects' do
  scenario 'User can see existing projects on the projects page' do
    create_project
    visit '/projects'
    expect(page.status_code).to eq 200
    within 'ul#projects' do
      expect(page).to have_content('Origami crane')
    end
  end
end
