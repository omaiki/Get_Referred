class CreateFriendships < ActiveRecord::Migration[5.0]
  def change
    create_table :friendships do |t|
      t.integer :user_id
      t.integer :friend_id
      t.string :status
      t.text :message
      t.text :answer
      t.text :link_role
      t.text :link_portfolio

      t.timestamps null: false
    end
  end
end
