class Utilisateur
	attr_accessor :nom, :amis
	def est_ami_avec(pers)
		amis.each do |ami|
			puts "je test sur " + ami
			if ami == pers
				return puts "Vous etes ami avec cette pers"
			end
		end
		return puts "Vous n'etes pas amis avec cette personne"
	end
end

bob = Utilisateur.new
bob.nom = "bob"
bob.amis = ["Robert"]
alice = Utilisateur.new
alice.nom = "Alice"
alice.amis = ["bob", "Robert"]
robert = Utilisateur.new
robert.nom = ["alice"]
robert.amis = ["bob"]

puts alice.amis.size
puts "Alice est ami avec bob"
alice.est_ami_avec("bob")
puts "est robert avec alice :"
robert.est_ami_avec("alice")