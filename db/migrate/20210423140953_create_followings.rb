class CreateFollowings < ActiveRecord::Migration[6.1]
  def change
    create_table :followings do |t|
      t.integer :following_id
      t.integer :follower_id

      t.timestamps
    end

    add_index :followings, :following_id
    add_index :followings, :follower_id
    add_index :followings, [:following_id, :follower_id], unique: true
  end
end
