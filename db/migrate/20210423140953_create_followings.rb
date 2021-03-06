class CreateFollowings < ActiveRecord::Migration[6.1]
  def change
    create_table :followings do |t|
      t.references :follower, index: true
      t.references :followed, index: true

      t.timestamps
    end
    add_foreign_key :followings, :users, column: :follower_id
    add_foreign_key :followings, :users, column: :followed_id
    add_index :followings, [:follower_id, :followed_id], unique: true
  end
end
