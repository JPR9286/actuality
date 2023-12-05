class UpdateArticleWithDiffbotJob < ApplicationJob
  queue_as :default
  sidekiq_options retry: false

  def perform(article)
    UpdateArticleWithDiffbot.new(article).call
  end
end
