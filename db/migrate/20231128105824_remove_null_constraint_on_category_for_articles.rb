class RemoveNullConstraintOnCategoryForArticles < ActiveRecord::Migration[7.1]
  def change
    change_column_null :articles, :category_id, true
  end
end
