class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
  	@recipe = Recipe.find(params[:recipe_id])
    @comment = @recipe.comments.build({content: params[:comment][:content], rate: params[:post][:rate]})
    @comment.user_id = current_user.id
  	if @comment.save
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

  def edit
    @comment = Comment.find_by(id: params[:id])
    if @comment.user_id = current_user.id
      redirect_to edit_recipe_path
    else
      redirect_to request.referer
    end
  end

   def update
    @comment = Comment.find_by(id:params[:id])
    @comment.content = params[:content]
    @comment.save
    redirect_to("/recipes/index")
  end

  private

  def recipe_comment_params
  	params.require(:recipe_comment).permit(:comment, :content, :recipe_id, :user_id)
  end

end