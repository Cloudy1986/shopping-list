require 'pg'

class Item

  attr_reader :id, :name

  def initialize(id:, name:)
    @id = id
    @name = name
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'shopping_list_test')
    else
      connection = PG.connect(dbname: 'shopping_list')
    end
    result = connection.exec_params('SELECT * FROM items;')
    result.map do |item|
      Item.new(id: item['id'], name: item['name'])
    end
  end
  
end
