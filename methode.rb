class Utilisateur
	attr_accessor :prenom, :nom, :pays

	def nom_complet
		prenom + " " + nom + " " + pays
	end

	def habite_en(valeur)
		valeur == pays
	end
end



bob = Utilisateur.new
bob.prenom = "Bob"
bob.nom = "Lenon"
bob.pays = "France"

puts bob.nom_complet

puts "Est ce que bob habite en France?"
if bob.habite_en("France")
	puts "Bonjour cher ami France"
else
	puts "Tu n'est pas France"