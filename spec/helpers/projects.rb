def create_project
  visit '/projects/new'
  fill_in 'title', with: 'Origami crane'
  fill_in 'materials', with: 'paper'
  fill_in 'instructions', with: 'Fold paper'
  fill_in 'image_URL', with: 'https://i.ytimg.com/vi/Ux1ECrNDZl4/hqdefault.jpg'
  click_button 'Create project'
end
