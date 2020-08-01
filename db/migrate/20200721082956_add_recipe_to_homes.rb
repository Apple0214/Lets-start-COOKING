class AddRecipeToHomes < ActiveRecord::Migration[5.2]
  def change
    add_column :homes, :Recipe, :text
  end
end
