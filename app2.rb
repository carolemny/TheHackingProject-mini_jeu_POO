require "bundler"
Bundler.require

require_relative "lib/game"
require_relative "lib/player"

def perform_v2
  puts "-------------------------------------------------\n|   Bienvenue sur 'ILS VEULENT TOUS MA POO' !   |\n|Le but du jeu est d'être le dernier survivant !|\n-------------------------------------------------"
  puts
  puts "Quel est ton prénom?"
  print "> "
  human_name = gets.chomp
  player3 = HumanPlayer.new(human_name)
  enemies = Array.new
  enemies << player1 = Player.new("Josiane")
  enemies << player2 = Player.new("José")
  #binding.pry
  puts
  puts "Bienvenue #{player3.name}! Tu vas combattre avec #{player1.name} et #{player2.name}, BONNE CHANCE !"
  puts
  while (player1.life_points > 0 || player2.life_points > 0) && player3.life_points > 0
    puts "Voici ton état de vie:"
    player3.show_state
    puts "Quelle action veux-tu effectuer ?"
    puts
    puts "\na - chercher une meilleure arme\ns - chercher à se soigner"
    puts
    puts "attaquer un joueur en vue :"
    print "0 - "
    player1.show_state
    print "1 - "
    player2.show_state
    puts
    print "> "
    choice = gets.chomp
    puts
    if choice == "a"
      player3.search_weapon
    elsif choice == "s"
      player3.search_health_pack
    elsif choice == "0"
      player3.attacks(player1)
    else
      player3.attacks(player2)
    end
    puts "Les autres joueurs t'attaquent !"
    enemies.each do |enemy|
      if enemy.life_points > 0
        enemy.attacks(player3)
      end
    end
    #binding.pry
    puts
    puts "          ***" #fin du round
    puts
  end
  puts
  puts "La partie est finie"
  if player3.life_points > 0
    puts "BRAVO ! TU AS GAGNE !"
  else
    puts "Loser ! Tu as perdu !"
  end
end

perform_v2
