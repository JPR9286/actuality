class Message < ApplicationRecord
  belongs_to :user
  belongs_to :article, optional: true
  belongs_to :chatroom
end
