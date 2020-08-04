class AddValueToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :value, :integer
  end
end
