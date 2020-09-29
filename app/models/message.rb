class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user

  validates :content, persence: true
end
