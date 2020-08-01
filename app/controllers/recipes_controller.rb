class RecipesController < ApplicationController
#ユーザーのログイン時のみshow,createの権限を付与するようにする
  before_action :acthenticate_user!, only: [:show, :create]

  def index
  	@recipes = Recipe.all #投稿一覧表示
    @recipe = Recipr.new #新規投稿できるように
  end

  def show
  	@recipe = Recipe.find(params[:id])
	  @recipes = Recipe.all
    @comments = @recipe.comments #投稿詳細に関連つけてあるコメントの取得
    @comment = Comment.new #新規コメントできるように
    #新しいコメント順にした方がいい？
  end

  def new
  	@recipe = Recipe.new
    @genres = Genre.all
  end

  def create
  	@recipe = Recipe.new(recipes_params)
    @recipe.user_id = current_user.id
    @recipe.genre_id = 1
    @recipe.save!
    redirect_to recipes_path
    #if elseを用いる　find_byであったらidを入れて、nillの時は新規登録際にelseに繋ぐ
  end

private

  def recipes_params
  	params.require(:recipe).permit(:title, :photo, :cooking, :item)
  end
end