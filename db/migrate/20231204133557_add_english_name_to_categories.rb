class AddEnglishNameToCategories < ActiveRecord::Migration[7.1]
  def change
    add_column :categories, :name_en, :string
  end
end
