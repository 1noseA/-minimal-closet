class CreateCoordinates < ActiveRecord::Migration[5.2]
  def change
    create_table :coordinates do |t|
      t.integer :user_id, null: false
      t.string :image_id, null: false
      t.text :text
      t.timestamps
    end
  end
end
