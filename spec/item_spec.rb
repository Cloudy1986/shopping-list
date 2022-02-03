require 'item'

describe Item do
  
  describe '.all' do
    it 'returns all the items' do
      Item.create(name: 'Potatoes')
      Item.create(name: 'Steak')
      Item.create(name: 'Bread')

      items = Item.all

      expect(items[0]).to be_a Item
      expect(items.length).to eq 3
      expect(items[0].name).to eq 'Potatoes'
      expect(items[1].name).to eq 'Steak'
      expect(items[2].name).to eq 'Bread'
    end
  end

  describe '.create' do
    it 'adds an item to the database' do
      item = Item.create(name: 'Cereal')

      items = Item.all

      expect(item).to be_a Item
      expect(item.name).to eq items[0].name
      expect(item.id).to eq items[0].id
    end
  end

  describe '.delete' do
    it 'deletes an item from the database' do
      item = Item.create(name: 'Milk')

      Item.delete(id: item.id)
      items = Item.all

      expect(items.length).to eq 0
      expect(items).to eq []
    end
  end

  describe '.find' do
    it 'returns the correct item' do
      item = Item.create(name: 'Butter')

      returned_item = Item.find(id: item.id)
      
      expect(returned_item).to be_a Item
      expect(returned_item.id).to eq item.id
      expect(returned_item.name).to eq item.name
    end
  end

end
