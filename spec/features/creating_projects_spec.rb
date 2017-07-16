feature 'Creating projects' do
  before(:each) do
    create_project
  end

  scenario 'User can create a project' do
    expect { create_project }.to change(Project, :count).by(1)
    expect(page).to have_content('Origami crane')
  end

  scenario 'User can add an image to their project' do
    click_link('Origami crane')
    expect(page).to have_xpath("//img[@src='https://i.ytimg.com/vi/Ux1ECrNDZl4/hqdefault.jpg']")
  end
end
