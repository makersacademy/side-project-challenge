def create_project
  visit '/projects/new'
  fill_in 'title', with: 'Origami crane'
  fill_in 'materials', with: 'paper'
  fill_in 'instructions', with: 'Fold paper'
  click_button 'Create project'
end 
