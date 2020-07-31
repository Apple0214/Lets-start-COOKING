class Recipe < ApplicationRecord
	belongs_to :genre
	belongs_to :user
	has_many :favorites
	has_many :likes, dependent: :destroy

	attachment :photo
end
