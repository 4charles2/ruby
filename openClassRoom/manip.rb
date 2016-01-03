class Utilisateur
	attr_accessor :prenom
	def initialize (prenom, sexe)
		if sexe == "f"
			@prenom = "Madame " + prenom
		else
			@prenom = "Monsieur " + prenom
		end
	end
end

alice = Utilisateur.new("Alice", "f")
puts alice.prenom
bob = Utilisateur.new("Bob", "h")
puts bob.prenom