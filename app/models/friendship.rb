class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, :class_name => "User"
  has_many :messages
  has_many :events

  # scope :between, -> (user_id,friend_id) do
  #   where("(friendships.user_id = ? AND friendships.friend_id = ?) OR (friendships.user_id = ? AND friendships.friend_id = ?)", user_id, friend_id, user_id, friend_id)
  # end
end
