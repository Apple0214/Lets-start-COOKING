class LikesController < ApplicationController
  before_action :recipe_params
  def like
    like = current_user.likes.new(recipe_id: @recipe.id)
    like.save
    redirect_to
  end

  def unlike
    like = current_user.likes.find_by(recipe_id: @recipe.id)
    like.destroy
  end

  private

  def recipe_id_params
    @recipe = Recipe.find(params[:recipe_id])
    @id_name = "#lile-link-#{@recipe.id}"
  end
end