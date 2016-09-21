class Message < ApplicationRecord
  belongs_to :friendship
  belongs_to :user
  has_many :responses

  # takes the time created_at and converts it to pacific standard time and then into a readable date and time
  def created
   created_at.in_time_zone("Pacific Time (US & Canada)").strftime('%m-%d-%Y %I:%M')
  end
end
