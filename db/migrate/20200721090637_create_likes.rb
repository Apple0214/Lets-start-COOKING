class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |f|
      f.integer :story_id
      f.integer :user_id

      f.timestamps
    end
  end
end
