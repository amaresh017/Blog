class CreateArticles < ActiveRecord::Migration[5.0]
  def up
    create_table :articles do |t|
      t.integer "user_id"               # id of the user who is creating this article.
    	t.string "title", :limit => 50
    	t.text "content", :limit => 10240 # maximum 2048 words, assuming each word length has 5 letters on an avg.
      t.timestamps
    end
    add_index("articles", "user_id")
  end
  def down
    drop_table :articles
  end
end
