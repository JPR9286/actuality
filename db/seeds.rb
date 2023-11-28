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

user1 = User.create!(email: "adel@mail.com", password: "123456", nickname: "Adel")
category = Category.create!(name: "foot")
chatroom = Chatroom.create!(title: "batch1410", user: user1, category:category)
message = chatroom.messages.create!(user: user1, content: "hello")

user2 = User.create!(email: "jeremy@mail.com", password: "123456", nickname: "Jeremy")
category = Category.create!(name: "tennis")
chatroom = Chatroom.create!(title: "batch1410", user: user2, category:category)
message = chatroom.messages.create!(user: user2, content: "hello")

user3 = User.create!(email: "jerome@mail.com", password: "123456", nickname: "Jerome")
chatroom = Chatroom.create!(title: "batch1410", user: user3, category:category)
message = chatroom.messages.create!(user: user3, content: "hello")

user4 = User.create!(email: "alex@mail.com", password: "123456", nickname: "Alex")
chatroom = Chatroom.create!(title: "batch1410", user: user4, category:category)
message = chatroom.messages.create!(user: user4, content: "hello")
