class Home < ApplicationRecord
	belongs_to :user
	has_many :likes, dependent: :destroy
	has_many :liking_users, through: :likes, source: :user
	attachment :photo

	def self.search(search)
		if search
			Recipe.where(['content LIKE ?', "%#{search}%"])
		else
			Recipe.all
		end
    end
end
