class RenamePhotoToPhotoId < ActiveRecord::Migration[5.2]
  def change
  	rename_column :recipes, :photo, :photo_id
  end
end
