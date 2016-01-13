class Personne
  attr_accessor :nom, :points_de_vie, :en_vie
 
  def initialize(nom)
    @nom = nom
    @points_de_vie = 100
    @en_vie = true
  end
 
  def info
    # A faire:
    # - Renvoie le nom et les points de vie si la personne est en vie
      if en_vie
          return "#{nom} a #{points_de_vie} points de vie."
    # - Renvoie le nom et "vaincu" si la personne a été vaincue
      else
          return "#{nom} 'vaincu'"
      end
  end
 
  def attaque(personne)
    # A faire:
    # - Fait subir des dégats à la personne passée en paramètre
      personne.subit_attaque(self.degats)
    # - Affiche ce qu'il s'est passé
      puts "#{self.nom} a attaqué #{personne.nom}."
       
      self.degats
  end
 
  def subit_attaque(degats_recus)
    # A faire:
    # - Réduit les points de vie en fonction des dégats reçus
      self.points_de_vie -= degats_recus
    # - Affiche ce qu'il s'est passé
      puts "#{self.nom} a subit #{degats_recus} de dégâts."
    # - Détermine si la personne est toujours en_vie ou non
      if points_de_vie < 0
          en_vie = false
          puts "#{self.nom} est mort."
      else
          en_vie = true
          puts "#{self.nom} est toujours en vie"
      end
       
      self.degats
       
  end
end
 
class Joueur < Personne
  attr_accessor :degats_bonus
 
  def initialize(nom)
    # Par défaut le joueur n'a pas de dégats bonus
    @degats_bonus = 0
       
    # Appelle le "initialize" de la classe mère (Personne)
    super(nom)
  end
 
  def degats
    # A faire:
    # - Calculer les dégats
      # Les dégâts correspondent à 25% des points de vie
      degats = self.points_de_vie * 0.25 + self.degats_bonus
    # - Affiche ce qu'il s'est passé
      puts degats
      return degats
  end
 
  def soin
    # A faire:
    # - Gagner de la vie
      self.points_de_vie += 10
    # - Affiche ce qu'il s'est passé
      puts "Vous avez gagné +10 points de vie. Au total, vous en avez maintenant #{self.points_de_vie}"
  end
 
  def ameliorer_degats
    # A faire:
    # - Augmenter les dégats bonus
      self.degats_bonus =+ 10
    # - Affiche ce qu'il s'est passé
      puts "Vous avez obtenu +10 de dégâts bonus"
  end
end
 
class Ennemi < Personne
  def degats
    # A faire:
    # - Calculer les dégats
      # Les dégâts correspondent à 25% des points de vie
      degats = self.points_de_vie * 0.10
      return degats
  end
end
 
class Jeu
  def self.actions_possibles(monde)
    puts "ACTIONS POSSIBLES :"
 
    puts "0 - Se soigner"
    puts "1 - Améliorer son attaque"
 
    # On commence à 2 car 0 et 1 sont réservés pour les actions
    # de soin et d'amélioration d'attaque
    i = 2
    monde.ennemis.each do |ennemi|
      puts "#{i} - Attaquer #{ennemi.info}"
      i = i + 1
    end
    puts "99 - Quitter"
  end
 
  def self.est_fini(joueur, monde)
    # A faire:
    # - Déterminer la condition de fin du jeu
      # Si un ennemi est toujours en vie ET que joueur est toujours en vie, on continue.
      # Adversaire permet de calculer le nombre d'adversaire toujours en vie
      adversaire = 0
       
      monde.ennemis.each do |ennemi|
          adversaire += 1 if ennemi.en_vie
      end
       
      if joueur.en_vie && adversaire > 0
          return false
      # Sinon, le jeu est terminé
      else
          return true
      end
  end
end
 
class Monde
    attr_accessor :ennemis, :ennemiss_en_vie#chez changer le nom
    def initialize
        @ennemis = []
        @ennemiss_en_vie = []#chez changer le nom
    end
     
  def ennemis_en_vie
    # creation d'un tableau vide où seront stockés les ennemis en vie
    # on boucle sur le tableau des ennemis
    @ennemis.each do |ennemi|
         if ennemi.en_vie == true
              ennemiss_en_vie << ennemi#chez changer le nom
          end
          return self.ennemiss_en_vie#chez changer le nom
          #J'ai suprimer cette ligne
    end
  end
end
 
##############
 
# Initialisation du monde
monde = Monde.new
 
# Ajout des ennemis
monde.ennemis = [
  Ennemi.new("Balrog"),
  Ennemi.new("Goblin"),
  Ennemi.new("Squelette")
]
 
# Initialisation du joueur
joueur = Joueur.new("Jean-Michel Paladin")
 
# Message d'introduction. \n signifie "retour à la ligne"
puts "\n\nAinsi débutent les aventures de #{joueur.nom}\n\n"
 
# Boucle de jeu principale
100.times do |tour|
  puts "\n------------------ Tour numéro #{tour} ------------------"
 
  # Affiche les différentes actions possibles
  Jeu.actions_possibles(monde)
 
  puts "\nQUELLE ACTION FAIRE ?"
  # On range dans la variable "choix" ce que l'utilisateur renseigne
  choix = gets.chomp.to_i
 
  # En fonction du choix on appelle différentes méthodes sur le joueur
  if choix == 0
    joueur.soin
  elsif choix == 1
    joueur.ameliorer_degats
  elsif choix == 99
    # On quitte la boucle de jeu si on a choisi
    # 99 qui veut dire "quitter"
    break
  else
    # Choix - 2 car nous avons commencé à compter à partir de 2
    # car les choix 0 et 1 étaient réservés pour le soin et
    # l'amélioration d'attaque
    ennemi_a_attaquer = monde.ennemis[choix - 2]
    joueur.attaque(ennemi_a_attaquer)
  end
 
  puts "\nLES ENNEMIS RIPOSTENT !"
  # Pour tous les ennemis en vie ...
  monde.ennemis_en_vie.each do |ennemi|
    # ... le héro subit une attaque.
    ennemi.attaque(joueur)
  end
 
  puts "\nEtat du héro: #{joueur.info}\n"
 
  # Si le jeu est fini, on interompt la boucle
  break if Jeu.est_fini(joueur, monde)
end
 
puts "\nGame Over!\n"
 
# A faire:
# - Afficher le résultat de la partie
puts "Vous avez #{self.points_de_vie} points de vie."
monde.ennemis.each do |ennemi|
    puts "#{ennemi.nom} a #{ennemi.points_de_vie} points de vie."
end
 
if joueur.en_vie
  puts "Vous avez gagné !"
else
  puts "Vous avez perdu !"
end