class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :questions
  has_many :comments
  has_many :commentlikes
  has_many :commented_questions, through: :comments, source: :question
  has_many :liked_comments, through: :commentlikes, source: :comment

  has_many :votes
  has_many :photolikes
  has_many :liked_photos, through: :photolikes, source: :photo

end
