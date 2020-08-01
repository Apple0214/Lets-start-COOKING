class AddNameKanjiMeiToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name_kanji_mei, :string
  end
end
