class RecipesController < ApplicationController
  def index
  	@recipes = Recipe.all
  end

  def show
  	@recipe = Recipe.find(params[:id])
	  @recipes = Recipe.all
    @comment = Comment.new
    #新しいコメント順
    @comments = @recipe.comments.order(created_at: :desc)
  end

  def new
  	@recipe = Recipe.new
  end

  def create
  	@recipe = Recipe.new(recipes_params)
    @recipe.user_id = current_user.id
    @recipe.genre_id = 1
    @recipe.save!
    redirect_to recipes_path
  end

private

  def recipes_params
  	params.require(:recipe).permit(:title, :photo, :cooking, :item)
  end
end