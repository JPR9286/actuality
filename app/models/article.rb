class Article < ApplicationRecord
  belongs_to :category
  validates :title, :article_url, presence: true

  include PgSearch::Model

  pg_search_scope :search_by_title_and_description,
    against: [ :title, :description ],
    using: {
      tsearch: { prefix: true }
    }
end
