require 'item'

describe Item do
  
  describe '.all' do
    it 'returns all the items' do

      connection = PG.connect(dbname: 'shopping_list_test')
      connection.exec("INSERT INTO items (name) VALUES ('Potatoes');")
      connection.exec("INSERT INTO items (name) VALUES ('Steak');")
      connection.exec("INSERT INTO items (name) VALUES ('Bread');")

      items = Item.all

      expect(items[0]).to be_a Item
      expect(items.length).to eq 3
      expect(items[0].name).to eq 'Potatoes'
      expect(items[1].name).to eq 'Steak'
      expect(items[2].name).to eq 'Bread'
    end
  end

end
