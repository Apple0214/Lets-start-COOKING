class AddUserToFavorites < ActiveRecord::Migration[5.2]
  def change
  	drop_table :favorites
  	create_table :favorites do |f|
      f.references :user, foreign_key: true,index:true
      f.references :recipes, foreign_key: true,index:true
      f.timestamps
    end
  end
end
