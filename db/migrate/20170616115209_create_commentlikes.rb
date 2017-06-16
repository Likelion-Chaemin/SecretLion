class CreateCommentlikes < ActiveRecord::Migration
  def change
    create_table :commentlikes do |t|

      t.timestamps null: false
    end
  end
end
