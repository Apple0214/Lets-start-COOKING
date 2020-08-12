class RecipesController < ApplicationController
#ユーザーのログイン時のみshow,createの権限を付与するようにする
  before_action :authenticate_user!, only: [:show, :create]

  def index
    search_word = params["recipe"]
  	@recipes = Recipe.where(['title LIKE ?', "%#{search_word}%"]) #検索に関する投稿一覧表示
    @recipe = Recipe.new #新規投稿できるように
    @all_ranks = Recipe.find(Like.group(:recipe_id).order('count(recipe_id) desc').limit(3).pluck(:recipe_id))
  end

  def show
  	@recipe = Recipe.find(params[:id])
	  @recipes = Recipe.where(['title LIKE ?', "%#{@recipe.title}%"])
    @comments = @recipe.comments.order(id: "DESC") #投稿詳細に関連つけてあるコメントの取得
    @comment = Comment.new #新規コメントできるように
    #新しいコメント順にした
  end

  def new
  	@recipe = Recipe.new
    @genres = Genre.all
  end

  def create
  	@recipe = Recipe.new(recipes_params)
    #すでにあるgenreは選択できるようにし、ない物は新規追加させて、保存できる
    genre = Genre.find_or_create_by(name: params[:recipe][:genre_id])
    @recipe.user_id = current_user.id
    @recipe.genre_id = genre.id
    if @recipe.save
      redirect_to recipes_path
    else
      render :new
    end
  end

  def update
    @comment = Comment.find_by(id:params[:id])
    @comment.content = params[:content]
    @comment.save
    redirect_to("/recipes/index")
  end

  def edit
    @recipe = Recipe.find_by(id: params[:id])
  end

private

  def recipes_params
  	params.require(:recipe).permit(:title, :photo, :cooking, :item)
  end
end