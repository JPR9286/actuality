class UpdateArticleWithDiffbotJob < ApplicationJob
  queue_as :default

  def perform(article)
    UpdateArticleWithDiffbot.new(article).call
  end
end
