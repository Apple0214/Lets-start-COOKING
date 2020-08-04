class Genre < ApplicationRecord
	has_many :recipes

  def liked_by?(user)
  	likes.where(user_id: user.id).exists?
  end
end
