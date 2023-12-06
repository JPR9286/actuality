class AddApiDataInArticles < ActiveRecord::Migration[7.1]
  def change
    add_column :articles, :api_data, :jsonb
  end
end
