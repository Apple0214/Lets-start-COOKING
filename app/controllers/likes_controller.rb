class LikesController < ApplicationController
  before_action :recipe_id_params, only: [:like, :unlike]
  def like
    like = current_user.likes.new(recipe_id: @recipe.id)
    like.save
      flash[:success] = "お気に入りに追加しました。"
  end

  def unlike
    like = current_user.likes.find_by(recipe_id: @recipe.id)
    like.destroy
  end

  def index
    targetLikes = Like.where(user_id: current_user.id).select(:recipe_id)
    @recipes = Recipe.where(id: targetLikes)
  end

  private

  def recipe_id_params
   @recipe = Recipe.find(params[:id])
   @class_name = ".index_likes_#{@recipe.id}"
  end
end