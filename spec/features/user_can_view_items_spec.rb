feature 'View items in shopping list' do
  scenario 'user can view items in the shopping list' do
    visit '/'
    click_link 'View Shopping List'
    expect(page).to have_content 'Shopping List'
    expect(page).to have_content 'Apples'
    expect(page).to have_content 'Pies'
    expect(page).to have_content 'Toilet roll'
  end
end