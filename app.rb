require "bundler"
Bundler.require

require_relative "lib/game"
require_relative "lib/player"

def perform_v1
  player1 = Player.new("Josiane")
  player2 = Player.new("José")
  puts "#{player1.name} et #{player2.name} vont combattre :"
  puts
  while player1.life_points > 0 || player2.life_points > 0
    puts "Voici l'état de chaque joueur :"
    player1.show_state
    player2.show_state
    puts
    puts "Passons à la phase d'attaque :"
    player1.attacks(player2)
    break if player2.life_points <= 0
    player2.attacks(player1)
    break if player1.life_points <= 0
    #binding.pry
    puts
    puts "          ***" #fin du round
    puts
  end
end
perform_v1

