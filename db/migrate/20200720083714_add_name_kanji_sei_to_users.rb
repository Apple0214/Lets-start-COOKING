class AddNameKanjiSeiToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name_kanji_sei, :string
  end
end
