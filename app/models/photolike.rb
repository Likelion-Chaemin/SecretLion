class Photolike < ActiveRecord::Base
	belongs_to :vote
  belongs_to :user
  belongs_to :photo
end
