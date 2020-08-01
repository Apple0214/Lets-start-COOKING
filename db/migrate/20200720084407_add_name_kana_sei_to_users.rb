class AddNameKanaSeiToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name_kana_sei, :string
  end
end
