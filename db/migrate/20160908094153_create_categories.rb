class CreateCategories < ActiveRecord::Migration[5.0]
  def up
    create_table :categories do |t|
    	t.string "name", :limit => 50  # Name of the category of an article.
      t.timestamps
    end
  end
  def down 
  	drop_tables :categories
  end
end
