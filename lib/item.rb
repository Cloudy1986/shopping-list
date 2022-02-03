require 'pg'

class Item

  attr_reader :id, :name

  def initialize(id:, name:)
    @id = id
    @name = name
  end

  def self.all
    connection = PG.connect(dbname: 'shopping_list')
    result = connection.exec_params('SELECT * FROM items;')
    result.map do |item|
      Item.new(id: item['id'], name: item['name'])
    end
  end
end