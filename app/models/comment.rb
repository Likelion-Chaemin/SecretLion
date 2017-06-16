class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :question

  has_many :commentlikes
  has_many :comment_likers, through :commentlikes, source :user
end
