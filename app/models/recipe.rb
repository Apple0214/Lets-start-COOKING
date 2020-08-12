class Recipe < ApplicationRecord
	belongs_to :genre
	belongs_to :user
	has_many :favorites
	has_many :likes, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :liking_users, through: :likes, source: :user

	attachment :photo

	#空データを禁止
	validates :title, presence: true
	validates :item, presence: true
	validates :cooking, presence: true


  def liked_by?(user)
  	likes.where(user_id: user.id).exists?
  end
end
