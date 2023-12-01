class Message < ApplicationRecord
  belongs_to :user
  belongs_to :article, optional: true
  belongs_to :chatroom
  validates :content, presence: true

  def sender?(a_user)
    user_id == a_user.id
  end
end
