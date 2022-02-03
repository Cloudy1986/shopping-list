feature 'Delete Item' do
  scenario 'user can delete an item from the shopping list' do
    
    visit '/shopping-list'
    click_link 'Add item'
    fill_in 'name', with: 'Turnip'
    click_button 'Submit'
    click_button 'Delete'

    expect(page).to have_content 'Shopping List'
    expect(page).not_to have_content 'Turnip'

  end
end