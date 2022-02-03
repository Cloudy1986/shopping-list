require 'item'

describe Item do
  
  describe '.all' do
    it 'returns all the items' do

      items = Item.all

      expect(items[0]).to be_a Item
      expect(items.length).to eq 3
      expect(items[0].name).to eq 'Apples'
      expect(items[1].name).to eq 'Pies'
      expect(items[2].name).to eq 'Toilet Rolls'
    end
  end

end
