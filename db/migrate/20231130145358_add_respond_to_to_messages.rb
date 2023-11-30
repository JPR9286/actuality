class AddRespondToToMessages < ActiveRecord::Migration[7.1]
  def change
    add_column :messages, :response, :string
  end
end
