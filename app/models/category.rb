class Category < ApplicationRecord
  has_many :user_categories
  has_many :articles, dependent: :destroy
  has_many :chatrooms, dependent: :nullify
  validates :name, presence: true, uniqueness: true
end
