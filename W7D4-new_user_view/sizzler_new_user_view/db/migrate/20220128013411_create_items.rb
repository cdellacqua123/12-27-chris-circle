class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :product_name, null: false
      t.text :product_description
      t.float :price, null: false
      t.integer :seller_id, null: false
      t.timestamps
    end
    add_index :items, :seller_id
  end
end
