class AddImageToChatrooms < ActiveRecord::Migration[7.1]
  def change
    # add image_url column to chatrooms table
    add_column :chatrooms, :image_url, :string
  end
end
