class AddAvatarImgToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :image_url, :string
  end
end
