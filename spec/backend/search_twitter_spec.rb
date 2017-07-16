feature 'search' do
  scenario 'you can search tweets' do
    visit('/')
    fill_in(:search, with: 'food')
    expect('page').to have_content('food was delicious')
  end
  
end
