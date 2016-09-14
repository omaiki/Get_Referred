class User < ApplicationRecord
  has_one :profile

  has_secure_password

  attr_accessor :email, :password, :password_confirmation

  validates :email, uniqueness: true,
  validates :password, presence: true,
                                      length: {
                                      minimum: 6,
                                      maximum: 20
                                      }
  validates :password_confirmation, presence: true
end
