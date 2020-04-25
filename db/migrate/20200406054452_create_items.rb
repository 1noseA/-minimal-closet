class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :user_id
      t.integer :category_id
      t.integer :scene_id
      t.integer :season_id
      t.string :item_image_id
      t.string :name
      t.text :text
      t.timestamps
    end
  end
end
