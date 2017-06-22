class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id, null: false
      t.string :title
      t.string :content
      t.timestamps null: false
    end
  end
end
