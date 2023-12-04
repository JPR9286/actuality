class Article < ApplicationRecord
  belongs_to :category, optional: true
  validates :title, :article_url, presence: true

  include PgSearch::Model

  pg_search_scope :search_by_title_and_description,
    against: [ :title, :description ],
    using: {
      tsearch: { prefix: true }
    }

  validates :title, uniqueness: { scope: :date_article }

  # def summary
  #   set_summary if super.nil?

  #   super
  # end

  def set_summary
    # text = ExtractTextFromUrl.new(article_url).call['text']
    return unless content.present?

    openai_summary = AskOpenaiForSummary.new(content).call
    update(summary: openai_summary)
  end

end
