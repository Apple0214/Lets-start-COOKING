class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
  	@recipe = Recipe.find(params[:recipe_id])
  	@recipe_comment = current_user.recipe_comments.new(recipe_comments.params)
  	@recipe_comment.recipe_id = @recipe.id
  	if @recipe_comment.save
  		flash[:success] = "コメントに成功しました"
  	end
  	redirect_to request.referer
  end

  def destroy
  	@recipe = Recipe.find(params[:recipe_id])
  	recipe_comment = current_user.recipe_comments.find_by(id: params[:id], recipe_id: @recipe.id)
  	recipe_commet.destroy
  	redirect_to request.referer
  end

  private

  def recipe_comment_params
  	params.require(:recipe_comment).permit(:comment, :content, :recipe_id, :user_id)
  end

end