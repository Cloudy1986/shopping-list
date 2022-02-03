feature 'Add Item' do
  scenario 'user can add an item to the shopping list' do

    visit '/shopping-list'
    click_link 'Add item'
    fill_in 'name', with: 'Bleach'
    click_button 'Submit'
    
    expect(page).to have_content 'Shopping List'
    expect(page).to have_content 'Bleach'

  end
end
