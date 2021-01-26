class Player
  attr_accessor :name, :life_points

  def initialize(player_name) #permet de générer une instance de la classe Player
    @name = player_name.to_s
    @life_points = 10 #identique pour tous les joueurs au départ
  end

  def show_state #permet d'afficher l'état d'un joueur
    puts "#{@name} a #{@life_points} point(s) de vie!"
  end

  def gets_damage(damage_points) #fait baisser le niveau de vie en fonction des attaques reçues
    @life_points = @life_points - damage_points
    if @life_points <= 0
      puts "#{@name} a été tué..."
    end
  end

  def attacks(attacked_player)
    puts "#{self.name} attaque #{attacked_player.name}."
    damage_points_received = compute_damage
    puts "#{self.name} lui inflige #{damage_points_received} point(s) de dommages !"
    attacked_player.gets_damage(damage_points_received)
  end

  def compute_damage
    return rand(1..6)
  end
end
