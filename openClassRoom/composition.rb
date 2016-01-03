class Eleve
	attr_accessor :nom
end

class Examen
	attr_accessor :nom, :note

	def initialize(nom,note)
		@nom = nom
		@note = note
	end
end

mon_eleve = Eleve.new
mon_eleve.nom = "Billy"

maths = Examen.new("maths", 10)
philo = Examen.new("philo", 15)