class AddCookingToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :cooking, :text
    add_column :recipes, :item, :text
    add_column :recipes, :photo, :string
  end
end
