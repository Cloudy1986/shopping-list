feature 'Edit Item' do
  scenario 'user can edit an item' do

    visit '/shopping-list'
    click_link 'Add item'
    fill_in 'name', with: 'Sprouts'
    click_button 'Submit'
    click_button 'Edit item'
    fill_in 'name', with: 'Stuffing'
    click_button 'Submit'

    expect(page).to have_content 'Shopping List'
    expect(page).not_to have_content 'Sprouts'
    expect(page).to have_content 'Stuffing'

  end
end