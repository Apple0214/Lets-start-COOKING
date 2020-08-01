class Like < ApplicationRecord
  belongs_to :recipe, counter_cache: :likes_count
  belongs_to :user
  #item_idとuser_idの組が1組しかないようにバリデーションをしてあげる
  validates_uniqueness_of :recipe_id, scope: :user_id
end
