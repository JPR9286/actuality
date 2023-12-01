class Category < ApplicationRecord
  has_many :user_categories, dependent: :destroy
  has_many :articles, dependent: :destroy
  has_many :chatrooms, dependent: :nullify
  has_many :image_urls, through: :articles
  validates :name, presence: true, uniqueness: true
end
