class Vote < ActiveRecord::Base
  belongs_to :user
	has_many :vote_records
  has_many :target_users, through: :vote_record, source: :user
end
