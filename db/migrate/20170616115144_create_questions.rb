class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :user_id, null: false
<<<<<<< HEAD
      t.string :name
      t.integer :to_user_id
      t.text :title
      t.text :description
=======
      t.integer :to_user_id
      t.string :title
      t.string :content
>>>>>>> ff7e86acb2a9aa440d1e2576bf1b7be571942eb5
      t.timestamps null: false
    end
  end
end
