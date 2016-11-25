class User < ApplicationRecord
  has_secure_password
  acts_as_messageable

  def name
    email
  end

  def mailboxer_email(*)
    email
  end

  has_one :profile
  has_many :friendships
  has_many :friends, :through => :friendships, :class_name => "User"
  has_many :messages
  has_many :events

  validates :email, uniqueness: true


end
