class AddRecipeIdToLike < ActiveRecord::Migration[5.2]
  def change
  	add_column :likes, :recipe_id, :integer
  	remove_column :likes, :story_id, :integer
  end
end
