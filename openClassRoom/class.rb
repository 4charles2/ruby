class Utilisateur
	attr_accessor :prenom, :nom
end

class PostSurUnBlog
	attr_accessor :titre, :contenu, :auteur
end

class Email
	attr_accessor :envoyeur, :contenu, :sujet
end

Bob = Utilisateur.new
Bob.prenom = "Bob"
Bob.nom = "Lenon"

puts Bob.prenom + " " + Bob.nom

Jane = Utilisateur.new
Jane.prenom = "Jane"
Jane.nom = "Lemon"

puts Jane.prenom + " " + Jane.nom