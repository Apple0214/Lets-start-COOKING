class Recipe < ApplicationRecord
	belongs_to :genre
	belongs_to :user
	has_many :favorites
	has_many :likes, dependent: :destroy
	has_many :comments, dependent: :destroy

	attachment :photo

  def liked_by?(user)
  	likes.where(user_id: user.id).exists?
  end
end
