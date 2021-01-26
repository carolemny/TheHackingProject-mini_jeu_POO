require "bundler"
Bundler.require

require_relative "lib/game"
require_relative "lib/player"

def perform_v3
  puts "-------------------------------------------------\n|   Bienvenue sur 'ILS VEULENT TOUS MA POO' !   |\n|Le but du jeu est d'être le dernier survivant !|\n-------------------------------------------------"
  puts
  puts "Quel est ton prénom?"
  print "> "
  human_name = gets.chomp
  my_game = Game.new(human_name)
  puts
  puts "Bienvenue #{human_name}! Tu vas combattre avec nos super Bots. BONNE CHANCE !"
  puts
  while my_game.is_still_ongoing? == true
    my_game.menu
    user_input = gets.chomp
    puts
    my_game.menu_choice(user_input)
    puts "Appuie sur ENTREE pour continuer"
    gets.chomp
    my_game.enemies_attack
    puts "Appuie sur ENTREE pour continuer"
    gets.chomp
    my_game.show_players
    puts
    puts "          ***"
    puts
  end
  my_game.end
end

perform_v3
