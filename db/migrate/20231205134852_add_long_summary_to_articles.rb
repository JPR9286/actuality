class AddLongSummaryToArticles < ActiveRecord::Migration[7.1]
  def change
    add_column :articles, :long_summary, :text
  end
end
