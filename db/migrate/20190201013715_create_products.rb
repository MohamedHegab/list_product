class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title,        null: false, default: ""
      t.text :description,    null: false, default: ""
      t.float :price, precision: 4, scale: 3
      t.integer :category_id, index: true, foreign_key: true

      t.timestamps
    end
  end
end
