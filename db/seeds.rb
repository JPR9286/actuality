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

# Création des utilisateurs
user1 = User.create!(email: "adel@mail.com", password: "123456", nickname: "Adel")
user2 = User.create!(email: "jeremy@mail.com", password: "123456", nickname: "Jeremy")
user3 = User.create!(email: "jerome@mail.com", password: "123456", nickname: "Jerome")
user4 = User.create!(email: "alex@mail.com", password: "123456", nickname: "Alex")

# Assurez-vous d'avoir un modèle Category ou supprimez cette partie si inutile
category = Category.create!(name: "foot")

# Création de la chatroom
chatroom = Chatroom.create!(title: "PSG", user:user1, category: category)

# Création des messages dans la discussion sur la victoire du PSG
chatroom.messages.create!(user: user1, content: "Avez-vous vu le dernier match du PSG ? Incroyable performance !")
chatroom.messages.create!(user: user2, content: "Oui, c'était un match fantastique. Leur attaque était impressionnante.")
chatroom.messages.create!(user: user3, content: "Absolument, et quelle défense ! PSG semble imbattable en ce moment.")
chatroom.messages.create!(user: user4, content: "Leur stratégie était sur point. L'entraineur a vraiment fait un excellent travail.")

chatroom.messages.create!(user: user1, content: "Hey, vous avez maté le match du PSG hier ? Trop fort !")
chatroom.messages.create!(user: user2, content: "Grave ! Ils ont tout déchiré. L'attaque était au top !")
chatroom.messages.create!(user: user3, content: "Carrément, et cette défense... Aucun moyen de passer, ils étaient sur un autre niveau.")
chatroom.messages.create!(user: user4, content: "Le coach a assuré avec sa tactique. On dirait qu'ils peuvent battre n'importe qui maintenant.")
chatroom.messages.create!(user: user1, content: "J'espère qu'ils garderont ce niveau pour la Ligue des Champions. Ça promet !")
chatroom.messages.create!(user: user2, content: "Ouais, et j'ai vu qu'ils préparent déjà des transferts pour renforcer l'équipe. Ça va être dingue.")
chatroom.messages.create!(user: user3, content: "Faut juste espérer qu'ils restent concentrés et qu'ils se laissent pas distraire par la hype.")
chatroom.messages.create!(user: user4, content: "Totalement. Mais bon, avec ce qu'ils montrent en ce moment, ils ont toutes leurs chances.")
chatroom.messages.create!(user: user1, content: "Allez, on croise les doigts pour eux ! PSG en force !")
chatroom.messages.create!(user: user2, content: "Paris est magique ! On y croit à fond pour cette saison !")

# Note : Ce code suppose que le modèle Chatroom et ses associations avec le modèle Message sont correctement configurés dans votre application Rails.

# Note : Ce code suppose que les modèles User, Chatroom, Message, et Category sont correctement configurés dans votre application Rails.

# Assumant que la chatroom et les utilisateurs (user1 à user4) ont déjà été créés

# Création de la chatroom
chatroom = Chatroom.create!(title: "JO 2024", user:user3, category: category)
# Messages dans la discussion sur les transports en commun à Paris pour les JO 2024
chatroom.messages.create!(user: user1, content: "Pensez-vous que les transports en commun à Paris seront prêts pour les JO 2024 ?")
chatroom.messages.create!(user: user2, content: "J'ai entendu dire qu'ils prévoient d'étendre certaines lignes de métro.")
chatroom.messages.create!(user: user3, content: "Oui, et il y aura aussi des améliorations sur les lignes de bus et de tramway.")
chatroom.messages.create!(user: user4, content: "L'enjeu sera de gérer l'afflux de touristes sans perturber le quotidien des Parisiens.")
chatroom.messages.create!(user: user1, content: "Exactement. J'espère aussi qu'ils amélioreront l'accessibilité pour les personnes à mobilité réduite.")
chatroom.messages.create!(user: user2, content: "C'est crucial. Les JO sont une opportunité pour rendre la ville plus accueillante pour tous.")
chatroom.messages.create!(user: user3, content: "Je me demande si les tarifs des transports vont augmenter pendant les jeux.")
chatroom.messages.create!(user: user4, content: "Bonne question. Ce serait bien d'avoir des tarifs spéciaux pour les événements.")
chatroom.messages.create!(user: user1, content: "Ils devraient aussi renforcer la sécurité dans les stations et les trains.")
chatroom.messages.create!(user: user2, content: "En tout cas, c'est une occasion en or pour Paris de montrer sa capacité à accueillir un événement mondial.")

chatroom = Chatroom.create!(title: "Le Wagon", user:user2, category: category)
# Messages sur la formation Le Wagon pour apprendre à développer en 9 semaines
chatroom.messages.create!(user: user1, content: "Avez-vous des retours sur la formation de 9 semaines de Le Wagon pour apprendre le développement web ?")
chatroom.messages.create!(user: user2, content: "J'ai un ami qui l'a fait et il en était très satisfait. Il a trouvé un job en tant que développeur juste après.")
chatroom.messages.create!(user: user3, content: "Le programme est intense, mais c'est incroyable ce que l'on peut apprendre en si peu de temps.")
chatroom.messages.create!(user: user4, content: "J'entends dire qu'ils mettent beaucoup l'accent sur la pratique et les projets réels.")
chatroom.messages.create!(user: user1, content: "Oui, et apparemment ils ont un bon réseau d'anciens élèves et d'entreprises partenaires.")
chatroom.messages.create!(user: user2, content: "Est-ce adapté pour quelqu'un sans aucune expérience en codage ?")
chatroom.messages.create!(user: user3, content: "Absolument, ils commencent par les bases avant de passer à des concepts plus avancés.")
chatroom.messages.create!(user: user4, content: "Leur curriculum inclut aussi des leçons sur le travail en équipe et sur la gestion de projet, ce qui est essentiel dans le monde réel.")
chatroom.messages.create!(user: user1, content: "Je pense que le plus difficile est de garder le rythme, c'est vraiment intensif.")
chatroom.messages.create!(user: user2, content: "Oui, mais si tu es motivé et prêt à t'investir, ça semble être une excellente opportunité.")

# Note : Ce code suppose que le modèle Chatroom et ses associations avec le modèle Message sont correctement configurés dans votre application Rails.
