feature 'Viewing projects' do
  scenario 'I can see existing projects on the projects page' do
    Project.create(title: 'Origami crane', materials:'paper', instructions: 'Fold paper')
    visit '/projects'
    expect(page.status_code).to eq 200
    within 'ul#projects' do
      expect(page).to have_content('Origami crane')
    end
  end
end
