feature 'View items in shopping list' do
  scenario 'user can view items in the shopping list' do

    connection = PG.connect(dbname: 'shopping_list_test')
    connection.exec("INSERT INTO items (name) VALUES ('Oranges');")
    connection.exec("INSERT INTO items (name) VALUES ('Melon');")
    connection.exec("INSERT INTO items (name) VALUES ('Kiwi');")
    
    visit '/'
    click_link 'View Shopping List'
    expect(page).to have_content 'Shopping List'
    expect(page).to have_content 'Oranges'
    expect(page).to have_content 'Melon'
    expect(page).to have_content 'Kiwi'
  end
end
