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

  def self.create(name:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'shopping_list_test')
    else
      connection = PG.connect(dbname: 'shopping_list')
    end
    result = connection.exec_params("INSERT INTO items (name) VALUES ($1) RETURNING id, name;", [name])
    Item.new(id: result[0]['id'], name: result[0]['name'])
  end

  def self.delete(id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'shopping_list_test')
    else
      connection = PG.connect(dbname: 'shopping_list')
    end
    result = connection.exec_params("DELETE FROM items WHERE id = $1;", [id])
  end

  def self.find(id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'shopping_list_test')
    else
      connection = PG.connect(dbname: 'shopping_list')
    end
    result = connection.exec_params("SELECT * FROM items WHERE id = $1", [id])
    Item.new(id: result[0]['id'], name: result[0]['name'])
  end

end
