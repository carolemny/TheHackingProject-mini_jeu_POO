class Player
  attr_accessor :name, :life_points

  def initialize(player_name) #permet de générer une instance de la classe Player
    @name = player_name.to_s
    @life_points = 10 #identique pour tous les joueurs au départ
  end

  def show_state #permet d'afficher l'état d'un joueur
    if @life_points > 0
      puts "#{@name} a #{@life_points} point(s) de vie!"
    else
      puts "#{@name} est mort."
    end
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

class HumanPlayer < Player #hérite de la class Player
  attr_accessor :weapon_level

  def initialize(player_name)
    @weapon_level = 1
    super(player_name)
    @life_points = 100
  end

  def show_state #permet d'afficher l'état d'un joueur
    puts "Tu as #{@life_points} point(s) de vie et une arme de niveau #{@weapon_level} !"
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    weapon_found = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{weapon_found}!"
    if weapon_found > @weapon_level
      @weapon_level = weapon_found
      puts "Youhou ! Cette arme est meilleure que ton arme actuelle : tu la prends."
    else
      puts "Zut... elle n'est pas mieux que ton arme actuelle..."
    end
  end

  def search_health_pack
    health_pack_found = rand(1..6)
    if health_pack_found == 1
      puts "Tu n'as rien trouvé... "
    elsif 2 <= health_pack_found && health_pack_found <= 5
      @life_points = @life_points + 50
        if @life_points > 100
        @life_points = 100
        end
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
      puts "Tu as #{@life_points} points de vie."
    else health_pack_found == 6
      @life_points = @life_points + 80
        if @life_points > 100
        @life_points = 100
      end
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
      puts "Tu as #{@life_points} points de vie."     
    end
  end
end
