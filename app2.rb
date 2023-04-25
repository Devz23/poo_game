require 'bundler'
Bundler.require
system('cls') || system('clear')

require_relative 'lib/game'
require_relative 'lib/player'

puts "<----------------------------------------------->"
puts "| Bienvenue sur 'ILS VEULENT TOUS MA POO' !     |"
puts "| Le but du jeu est d'être le dernier survivant |"
puts "<----------------------------------------------->"

def create_characters
  puts "Qui es-tu ?"
  print ">"
  surname = gets.chomp
  user = HumanPlayer.new(surname)
  puts "Welcome #{surname}, ready ?!"
  return user
end 

def create_enemis
  list = []
  player1 = Player.new("Josiane")
  puts "#{player1.name} est dans la place"
  player2 = Player.new("José")
  puts "#{player2.name} est dans la place"
  list = save_enemies(list, player1)
  list = save_enemies(list, player2)
  return list
end 

def save_enemies (list, enemie)
  list << enemie
end 

def print_state(user, enemies)
  puts "Quelle actions veux-tu faire"
  print "a - chercher une meilleure arme | s - chercher à se soigner | 0 - "
  print enemies[0].show_state
  print " | 1 - "
  print enemies[1].show_state
  print "\nton choix : "
end 

def user_turn(user,enemies)
  puts "<----------------------------------------------->\n"
  print_state(user, enemies)
  input = gets.chomp
  while input != "a" && input != "s" && input != "0" && input != "1"
    puts "Veuillez modifier votre saisie"
    print_state(user, enemies)
    input = gets.chomp 
  end
  
  if input == "a"
    user.search_weapon
  elsif input == "s"
    user.search_health_pack
  elsif input == "0"
    user.attacks(enemies[0])
    enemies[0].show_state
  else
    user.attacks(enemies[1])
    enemies[1].show_state
  end
end



def fight(user, enemies)
  while user.life_points > 0 && (enemies[0].life_points > 0 || enemies[1].life_points > 0)
    print user.show_state
    user_turn(user, enemies)

    if (enemies[0].life_points > 0 && enemies[1].life_points > 0)
      puts "\nLes ennemis t'attaquent"
      
    elsif (enemies[0].life_points > 0 || enemies[1].life_points > 0)
      puts "\nLes ennemis t'attaquent"
    end

    if enemies.each{|mob| mob.attacks(user)}
  end 
end

if user.life_points > 0
  puts "\nBRAVO ! TU AS GAGNE"
else
  puts "\nLoser ! Tu as perdu"
end
end 

def main
  user = create_characters
  enemies = create_enemis
  fight(user, enemies)
end
main