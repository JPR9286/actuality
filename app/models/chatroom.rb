class Chatroom < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :messages, dependent: :destroy
  has_many :users, through: :messages
  validates :title, presence: true
  has_one_attached :photo

  include PgSearch::Model

  pg_search_scope :search_by_title,
    against: [:title],
    using: {
      tsearch: { prefix: true }
    }
end
