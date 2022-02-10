class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :email
      t.string :country, null: false
      t.integer :age, null: false
      t.timestamps
    end
    add_index :users, :username, unique: true
    add_index :users, :email
  end
end
