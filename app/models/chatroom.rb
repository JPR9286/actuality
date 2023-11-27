class Chatroom < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_many :messages
end
