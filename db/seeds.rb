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
Article.destroy_all

user1 = User.create!(email: "adel@mail.com", password: "123456", nickname: "Adel")
category = Category.create!(name: "foot")
chatroom = Chatroom.create!(title: "batch1410", user:user1, category: category)
message = chatroom.messages.create!(user:user1, content: "hello")

user2 = User.create!(email: "jeremy@mail.com", password: "123456", nickname: "Jeremy")
category = Category.create!(name: "tennis")
message = chatroom.messages.create!(user: user2, content: "hello")

user3 = User.create!(email: "jerome@mail.com", password: "123456", nickname: "Jerome")
message = chatroom.messages.create!(user: user3, content: "hello")

user4 = User.create!(email: "alex@mail.com", password: "123456", nickname: "Alex")
message = chatroom.messages.create!(user: user4, content: "hello")

# article1 = Article.new(title: "Voyage Culinaire en Asie : Plongée dans les Saveurs Exotiques de la Street Food.", article_url: "toto.com")
# article1.category = Category.all.sample
# article1.save!
# article2 = Article.new(title: "Victoire 4-0 du PSG dans le classico contre marseille", article_url: "toto.com")
# article2.category = Category.all.sample
# article2.save!
# article3 = Article.new(title: "Vers un Avenir Durable : Initiatives Écologiques et Changements Indispensables pour la Préservation de notre Planète.", article_url: "toto.com")
# article3.category = Category.all.sample
# article3.save!
# article4 = Article.new(title: "Les Innovations Technologiques qui Transforment Notre Quotidien : De la 5G à l'Intelligence Artificielle.", article_url: "toto.com")
# article4.category = Category.all.sample
# article4.save!
# article5 = Article.new(title: "L'Évolution du Fitness : Tendances Actuelles et Innovations qui Redéfinissent l'Entraînement Sportif.", article_url: "toto.com")
# article5.category = Category.all.sample
# article5.save!
# article6 = Article.new(title: "Civilisations Anciennes : À la Découverte des Mystères de l'Égypte Antique.", article_url: "toto.com")
# article6.category = Category.all.sample
# article6.save!
# article7 = Article.new(title: "Plongée Dans l'Univers Virtuel : Les Jeux Vidéo les Plus Attendus de l'Année et les Tendances Émergentes.", article_url: "world.com")
# article7.category = Category.all.sample
# article7.save!
# article8 = Article.new(title: "JO-2024 : le prix du ticket de métro va quasiment doubler durant l'été", article_url: "sport.com")
# article8.category = Category.all.sample
# article8.save!
# article9 = Article.new(title: "Japon Éternel : Une Odyssée Culturelle à Travers les Traditions, la Technologie et la Beauté Naturelle.", article_url: "japon.com")
# article9.category = Category.all.sample
# article9.save!
# article10 = Article.new(title: "Facebook et Instagram payants : une plainte pour infraction au droit européen des données personnelles", article_url: "facebook.com")
# article10.category = Category.all.sample
# article10.save!
