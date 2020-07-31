class AddItemToHomes < ActiveRecord::Migration[5.2]
  def change
    add_column :homes, :Item, :text
  end
end
