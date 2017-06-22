class CreateCommentlikes < ActiveRecord::Migration
  def change
    create_table :commentlikes do |t|
      t.integer :user_id, null: false
      t.integer :comment_id, null: false
      t.timestamps null: false
    end
  end
end
