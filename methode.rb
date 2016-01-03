class Utilisateur
	attr_accessor :prenom, :nom
	def nom_complet
		prenom + " " + nom
	end
end



bob = Utilisateur.new
bob.prenom = "Bob"
bob.nom = "Lenon"

puts bob.nom_complet

