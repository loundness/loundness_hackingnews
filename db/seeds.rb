
require 'faker'

number_of_data = 10

puts "-------------------------- *** ---------------------------------"
puts "Bonjour, nous allons créer un jeu de test pour tester nos Models"

puts " Suppression des anciennes données."    
User.delete_all
Link.delete_all
Comment.delete_all


users = []
links  = []

puts " Création de #{number_of_data} utilisateurs "    

number_of_data.times do
    users << User.create(first_name: Faker::Science.scientist,last_name: Faker::Company.name, email: Faker::Internet.email)
end 


puts " \nCréation des liens "    

number_of_data.times do
    user = users[Random.new.rand(0..users.size-1)]
    Random.new.rand(0..3).times do
      link = Link.create(url: Faker::Company.logo, user:user)
      puts " #{user.first_name} vient de créer le lien #{link.url}  "    
      links << link
     end 

end 

puts " \nCréation des commentaires " 

number_of_data.times do
    user = users[Random.new.rand(0..users.size-1)]
    link = links[Random.new.rand(0..links.size-1)]
    Random.new.rand(0..1).times do
      comment = Comment.create(content: Faker::Lorem.sentence(3), user: user,link: link)
      puts " #{user.first_name} vient d'ajouter un commentaire au lien #{link.url}  "    

     end 
end 
