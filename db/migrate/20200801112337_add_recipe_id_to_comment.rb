class AddRecipeIdToComment < ActiveRecord::Migration[5.2]
  def change
  	add_column :comments, :recipe_id, :integer
  end
end
