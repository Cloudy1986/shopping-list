require 'comment'

describe Comment do
  
  describe '.create' do
    it 'adds a comment to the database' do
      item = Item.create(name: 'Washing powder')

      comment = Comment.create(text: 'This is a comment', item_id: item.id)

      test_connection = PG.connect(dbname: 'shopping_list_test')
      test_result = test_connection.exec("SELECT * FROM comments WHERE item_id = #{item.id};")

      expect(comment).to be_a Comment
      expect(comment.text).to eq 'This is a comment'
      expect(comment.item_id).to eq item.id
      expect(comment.text).to eq test_result[0]['text']
      expect(comment.item_id).to eq test_result[0]['item_id']
    end
  end

end