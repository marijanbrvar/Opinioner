class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :full_name, null: false
      t.text :photo
      t.text :cover_image

      t.timestamps
    end
    add_index :users, :username, unique: true
  end
end
