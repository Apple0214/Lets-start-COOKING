class AddGenreIdToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :genre_id, :integer
    add_column :recipes, :title, :string
  end
end
