class CreateVoteRecords < ActiveRecord::Migration
  def change
    create_table :vote_records do |t|

      t.timestamps null: false
			t.integer :vote_counts
			t.integer :vote_id
			t.integer :user_id
    end
  end
end
