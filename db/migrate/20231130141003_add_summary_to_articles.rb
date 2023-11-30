class AddSummaryToArticles < ActiveRecord::Migration[7.1]
  def change
    add_column :articles, :summary, :text
  end
end
