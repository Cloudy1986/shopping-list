feature 'View items in shopping list' do
  scenario 'user can view items in the shopping list' do
    Item.create(name: 'Oranges')
    Item.create(name: 'Melon')
    Item.create(name: 'Kiwi')
    
    visit '/'
    click_link 'View Shopping List'
    
    expect(page).to have_content 'Shopping List'
    expect(page).to have_content 'Oranges'
    expect(page).to have_content 'Melon'
    expect(page).to have_content 'Kiwi'
  end
end
