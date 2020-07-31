class HomesController < ApplicationController

  def index
  	@recipes = Recipe.all
  	@recipe = Recipe.new
  end

  def new
  	@recipe = Recipe.new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.user_id = current_user.id

  	@recipe = Recipe.new(recipe_params)
  	@recipe.user_id = current_user.id
  	if @recipe.save and @photo.save
  		redirect_to recipe_path(@recipe), notice: "レシピが投稿されました"
  	else
  	  @recipes = Recipe.all
  	  render 'index'
  	end
  end

  def update
  	if @recipe.update(recipe_params)
  		recirect_to recipe_path(@recipe), notice: "レシピが更新されました"
  	else
  		render "edit"
  	end
  end

  def destroy
  	@recipe.destroy
  	recirect_to homes_path
  end

  def search
    @recipes = Recipe.search(params[:recipe])
  end

  private

  def recipe_params
  	params.require(:recipe).permit(:title, :body, :photo, :item)
  end


  def ensure_correct_user
  	@recipe = Recipe.find(params[:id])
  	unless @recipe.user == current_user
  		redirect_to homes_path
  	end
  end
end
