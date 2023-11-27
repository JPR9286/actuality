class Article < ApplicationRecord
  belongs_to :category
  validates :title, :atricle_url, presence: true
end
