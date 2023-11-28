class Article < ApplicationRecord
<<<<<<< HEAD
  belongs_to :category, optional: true
  validates :title, :article_url, presence: true
=======
  belongs_to :category
  has_many :messages
  validates :title, :atricle_url, presence: true
>>>>>>> c0c65190961ef5bd3db20e5a6b73e8e8e35db74d
end
