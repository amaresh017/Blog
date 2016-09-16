class CreateUsers < ActiveRecord::Migration[5.0]
  def up
    create_table :users do |t|
    	t.string "first_name", :limit => 30
    	t.string "last_name", :limit => 40
    	t.string "user_type"
      t.timestamps
    end
  end
  def down
  	drop_table :users
  end
end

  