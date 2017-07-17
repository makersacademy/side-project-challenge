feature 'index' do
  scenario 'there is a short description' do
    visit('/')
    expect('page').to have_content('Sentiment analysis is an app that allows you to search tweets on certain topics and then returns a brief sentiment analysis on the content of the tweets.')
  end
  
  scenario 'you can search for a topic' do
    visit('/')
    fill_in(:search, with: 'doctor who')
    click_on('Search')
    expect(page).to have_current_path('/search/results')
  end
  
end
