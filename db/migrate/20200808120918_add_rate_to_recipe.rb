class AddRateToRecipe < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :rate, :float, null: false, default: 0
  end
end
