class FavoriteRecipesController < ApplicationController
  before_action :authenticate_user!

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_favorite = current_user.favorites.new(recipe_id: @recipe.id)
    @recipe_favorite.recipe_id = @recipe.id
    if @recipe_favorite.save
      flash[:success] = "お気に入りに追加しました。"
    end
    redirect_to request.referer
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    favorite = current_user.favorites.find_by(recipe_id: @recipe.id)
    favorite.destroy
    redirect_to request.referer
  end

  def favorite_recipes_params
    params.require(:favorite_recipes).permit(:)
  end
end

