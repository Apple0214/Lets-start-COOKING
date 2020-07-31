class AddUserIdToRecipes < ActiveRecord::Migration[5.2]
  def change
  	add_reference :recipes, :user, index: true
  end
end
