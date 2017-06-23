class CreatePhotolikes < ActiveRecord::Migration
  def change
    create_table :photolikes do |t|
      t.integer :user_id, null: false
      t.integer :photo_id, null: false
			t.integer :vote_id, null: false
      t.timestamps null: false
    end
  end
end
