class Article < ApplicationRecord
  belongs_to :category, optional: true
  validates :title, :article_url, presence: true
end
