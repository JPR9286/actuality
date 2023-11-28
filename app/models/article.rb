class Article < ApplicationRecord
  belongs_to :category
  has_many :messages
  validates :title, :atricle_url, presence: true
end
