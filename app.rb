require 'bundler'
Bundler.require
system('cls') || system('clear')

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Josiane")
player2 = Player.new("José")

#puts "<---------------------->"
#puts "\n"

puts "Voici l'état de nos joueurs avant le duel"
puts player1.show_state
puts player2.show_state

puts "<---------------------->"
puts "\n"

while player1.life_points > 0 && player2.life_points > 0
 # puts "_______________________________________________"
 # puts "player1 : #{player1.life_points} / player2 : #{player2.life_points}"
 # puts "_______________________________________________"
  
  #break if player2.life_points  <= 0
  player1.attacks(player2)
  player2.attacks(player1)
  puts "<---------------------->"
  #puts "\n"
  #puts "Voici l'état de nos joueurs durant le combat"
  player1.show_state
  player2.show_state
  #end 
end 

#binding.pry