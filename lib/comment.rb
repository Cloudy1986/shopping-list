class Comment

  attr_reader :id, :text, :item_id

  def initialize(id:, text:, item_id:)
    @id = id
    @text = text
    @item_id = item_id
  end

  def self.create(text:, item_id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'shopping_list_test')
    else
      connection = PG.connect(dbname: 'shopping_list')
    end
    result = connection.exec_params("INSERT INTO comments (text, item_id) VALUES ($1, $2) RETURNING id, text, item_id;", [text, item_id])
    Comment.new(id: result[0]['id'], text: result[0]['text'], item_id: result[0]['item_id'])
  end

  def self.where(item_id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'shopping_list_test')
    else
      connection = PG.connect(dbname: 'shopping_list')
    end
    result = connection.exec_params("SELECT * FROM comments WHERE item_id = $1;", [item_id])
    result.map do |comment|
      Comment.new(id: comment['id'], text: comment['text'], item_id: comment['item_id'])
    end
  end

end
