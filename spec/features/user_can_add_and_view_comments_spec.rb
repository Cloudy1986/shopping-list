feature 'Add and View comments' do
  scenario 'user can add and view comments' do
    item = Item.create(name: 'Hair gel')
    visit 'shopping-list'
    expect(current_path).to eq '/shopping-list'
    expect(page).to have_content 'Shopping List'
    expect(page).to have_content 'Hair gel'
    
    click_button 'Add comment'
    expect(current_path).to eq "/shopping-list/#{item.id}/comment/new"
    expect(page).to have_content "Add a new comment"

    fill_in 'comment_text', with: 'This is urgent'
    click_button 'Submit'
    expect(current_path).to eq "/shopping-list/#{item.id}/comments"
    expect(page).to have_content 'This is urgent'
    
    click_button 'View shopping list'
    expect(current_path).to eq "/shopping-list"
    expect(page).to have_content 'Shopping List'
  end

  scenario 'user can navigate to view comments without adding a new comment' do
    item = Item.create(name: 'Hair gel')
    visit 'shopping-list'
    expect(current_path).to eq '/shopping-list'
    expect(page).to have_content 'Shopping List'
    expect(page).to have_content 'Hair gel'
    
    click_button 'View comments'
    expect(current_path).to eq "/shopping-list/#{item.id}/comments"
    expect(page).to have_content "Comments"
  end
end