class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :likes ,dependent: :destroy
  has_many :like_stories, through: :likes, source: :home
  has_many :recipes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites
  has_many :favorite_recipes, through: :favorite, source: :recipe

  #空データを禁止,長さの限定
  validates :name, presence: true, length: { maximum: 50 }
  #emailの重複,適切な文字のみに制限
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}

  #ブックマーク機能
  def favorite(recipes)
  	favorites.find_or_create_by(recipe_id: recipe_id)
  end

  def unfavorite(recipes)
  	favorite = favorites.find_by(recipe_id: recipe_id)
  	favorite.destroy if favorite
  end
  #いいね機能
  def like(recipes)
  	likes.find_or_create_by(recipe_id: recipe_id)
  end

 def unlike
 	like = likes.find_by(recipe_id: recipe_id)
 	like.destroy if like
 end

end
