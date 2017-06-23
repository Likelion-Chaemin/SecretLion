class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :user_id, null: false
      t.integer :to_user_id
      t.text :title
      t.text :description
      t.timestamps null: false
    end
  end
end
