class AddNameKanaMeiToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name_kana_mei, :string
  end
end
