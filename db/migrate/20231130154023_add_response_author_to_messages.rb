class AddResponseAuthorToMessages < ActiveRecord::Migration[7.1]
  def change
    add_column :messages, :response_author, :string
  end
end
