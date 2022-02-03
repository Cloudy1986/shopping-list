require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'shopping_list_test')
  p "Setting up test database"
  connection.exec("TRUNCATE items;")
end
