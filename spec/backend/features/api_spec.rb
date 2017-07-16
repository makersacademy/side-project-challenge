feature 'API' do
  before do
    visit('/api')
  end

  scenario 'API requests return JSON' do
    expect(page.response_headers['Content-Type']).to eq("application/json")
  end

  scenario 'API requests return a listicle title' do
    expect(page).to have_content /Top [0-9]+ ways to run tests./
  end

  feature 'Specific numbers in title' do
    scenario 'returns title with 50 in content' do
      visit('/api/50')
      expect(page).to have_content /Top 50 ways to run tests./
    end

    scenario 'returns title with 100 in content' do
      visit('/api/100')
      expect(page).to have_content /Top 100 ways to run tests./
    end
  end
end
