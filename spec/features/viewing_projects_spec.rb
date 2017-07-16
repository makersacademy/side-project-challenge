feature 'Viewing projects' do
  before(:each) do
    create_project
  end

  scenario 'User can see all existing projects on the projects page' do
    expect(page.status_code).to eq 200
    within 'ul#projects' do
      expect(page).to have_content('Origami crane')
    end
  end

  scenario 'User can view a particular project' do
    click_link('Origami crane')
    expect(page).to have_content('Fold paper')
  end
end
