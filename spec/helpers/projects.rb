def create_project
  visit '/projects/new'
  fill_in 'title', with: 'Origami crane'
  fill_in 'material_1', with: 'paper'
  fill_in 'instructions', with: 'Fold paper'
  fill_in 'image_URL', with: 'https://i.ytimg.com/vi/Ux1ECrNDZl4/hqdefault.jpg'
  fill_in 'author', with: 'Simon'
  click_button 'Create project'
end

def create_project_2
  visit '/projects/new'
  fill_in 'title', with: 'Origami crane'
  fill_in 'material_1', with: 'paper'
  fill_in 'material_2', with: 'card'
  fill_in 'instructions', with: 'Fold paper'
  fill_in 'image_URL', with: 'https://i.ytimg.com/vi/Ux1ECrNDZl4/hqdefault.jpg'
  fill_in 'author', with: 'Simon'
  click_button 'Create project'
end
