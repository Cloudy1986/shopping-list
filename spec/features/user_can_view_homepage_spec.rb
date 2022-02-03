feature 'Homepage' do
  scenario 'user can view homepage' do

    visit '/'
    expect(page).to have_content 'Welcome to the Shopping List app'
    
  end
end