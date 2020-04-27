class CreateConstants < ActiveRecord::Migration[5.2]
  def change
    create_table :constants do |t|
      t.integer :user_id
      t.integer :category_id
      t.integer :constant,null: false, default: 0

      t.timestamps
    end
  end
end
