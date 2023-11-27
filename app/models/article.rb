class Article < ApplicationRecord
  belongs_to :category
  has_many :messages
  
end
