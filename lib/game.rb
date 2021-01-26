class Game
  attr_accessor :human_player, :enemies

  def initialize(human_name)
    @human_player = HumanPlayer.new(human_name)
    @enemies = Array.new
    @enemies << player1 = Player.new("player1")
    @enemies << player2 = Player.new("player2")
    @enemies << player3 = Player.new("player3")
    @enemies << player4 = Player.new("player4")
  end

  def kill_player(dead_enemy)
    return @enemies.delete(dead_enemy) #élimine un adversaire tué
  end

  def is_still_ongoing?
    if @enemies.length > 0 && @human_player.life_points > 0 #le jeu continue tant que le @human_player a encore des points de vie et qu'il reste des Player à combattre dans l’array @enemies
      return true
    else
      return false
    end
  end

  def show_players
    human_player.show_state
    puts "Il reste #{@enemies.length} joueurs bots" #les bots sont au nombre de la taille de @enemies
  end

  def menu
    puts "Quelle action veux-tu effectuer ?"
    puts
    puts "\na - chercher une meilleure arme\ns - chercher à se soigner"
    puts
    puts "attaquer un joueur en vue :"
    @enemies.each_with_index do |enemy, index|
      print "#{index} - "
      enemy.show_state #si le enemy est mort il est retiré du @enemies, pas besoin d'affichage
    end
    print "> "
  end

  def menu_choice(user_input)
    @enemies.each do |enemy|
      if enemy.life_points <= 0
        kill_player(enemy)
      end
    end
    if user_input == "a"
      @human_player.search_weapon
    elsif user_input == "s"
      @human_player.search_health_pack
    else user_input.is_a?(Integer) == true
      @human_player.attacks(@enemies[user_input.to_i])     end
  end

  def enemies_attack
    puts "Les autres joueurs t'attaquent !"
    @enemies.each do |enemy|
      if enemy.life_points > 0
        enemy.attacks(@human_player)
      end
    end
  end

  def end
    puts "La partie est finie"
    if @human_player.life_points > 0
      puts "BRAVO ! TU AS GAGNE !"
    else
      puts "Loser ! Tu as perdu !"
    end
  end
end
