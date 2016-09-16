class CreateSubCategories < ActiveRecord::Migration[5.0]
  def up
    create_table :sub_categories do |t|
    	t.string "name", :limit => 40  # Name of sub-category of an article.
    	t.integer "category_id"        # Category id which this sub-category belongs to.
      # t.reference :category_id
      t.timestamps
    end
    add_index("sub_categories", "category_id")
  end
	def down
		drop_table :sub_categories	
	end
end