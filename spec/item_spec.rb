require 'item'

describe Item do
  
  describe '.all' do
    it 'returns all the items' do

      items = Item.all
      p items

      # expect(items[0]).to be an Item
      expect(items.length).to eq 3
      expect(items[0]).to eq 'Apples'
      expect(items[1]).to eq 'Pies'
      expect(items[2]).to eq 'Toilet rolls'
    end
  end

end
