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

  describe '.where' do
    it 'returns comments from the database' do
      item = Item.create(name: 'Buy stationary')
      Comment.create(text: 'I need pens', item_id: item.id)
      Comment.create(text: 'I need paper', item_id: item.id)

      test_connection = PG.connect(dbname: 'shopping_list_test')
      test_result = test_connection.exec_params("SELECT * FROM comments WHERE item_id = $1;", [item.id])

      comments = Comment.where(item_id: item.id)
      comment_1 = comments[0]
      comment_2 = comments[1]
      
      expect(comments.length).to eq 2
      expect(comment_1).to be_a Comment
      expect(comment_1.text).to eq 'I need pens'
      expect(comment_2.text).to eq 'I need paper'
      expect(comment_1.item_id).to eq item.id
      expect(comment_2.item_id).to eq item.id
      expect(comment_1.text).to eq test_result[0]['text']
      expect(comment_1.item_id).to eq test_result[0]['item_id']
    end
  end

end