class CreatePhotolikes < ActiveRecord::Migration
  def change
    create_table :photolikes do |t|

      t.timestamps null: false
    end
  end
end
