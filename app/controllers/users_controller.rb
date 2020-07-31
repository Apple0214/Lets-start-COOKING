class UsersController < ApplicationController
	def new
	  @user = User.new
	end

	def index
	  @users = User.all
	  @recipe = Recipe.new
	end

  private

  def user_params
  	params.require(:user).permit(:name, :introdution, :profile_image)
  end
end
