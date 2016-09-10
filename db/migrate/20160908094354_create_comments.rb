class CreateComments < ActiveRecord::Migration[5.0]
  def up
    create_table :comments do |t|
    	t.text "content", :limit =>1024  # What has been commented.
    	t.integer "user_id"              # Commentator, who has commented the comment on the article.
    	t.integer "article_id"           # Article, which it has been commented on.
      t.timestamps
    end
    add_index("comments", "user_id")
    add_index("comments", "article_id")
  end
  def down
  	drop_table :comments
  end
end