class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :vote_id, null: false
      t.integer :photo_user_id, null: false
      t.integer :like_count
      t.timestamps null: false
    end
  end
end
