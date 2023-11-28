# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Message.destroy_all
Chatroom.destroy_all
Category.destroy_all
User.destroy_all

user1 = User.create!(email: "bob@mail.com", password: "123456", nickname: "bob")
category = Category.create!(name: "foot")
chatroom = Chatroom.create!(title: "batch1410", user:user1, category:category)
message = chatroom.messages.create!(user: user1, content: "hello")

user2 = User.create!(email: "toto@mail.com", password: "123456", nickname: "toto")
category = Category.create!(name: "foot")
chatroom = Chatroom.create!(title: "batch1410", user:user2, category:category)
message = chatroom.messages.create!(user: user2, content: "hello")
