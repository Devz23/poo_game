
class Player
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    if @life_points > 0
      puts "#{@name} a #{@life_points} points de vie"
    else 
      puts "#{@name} n'a de plus point de vie"
    end 
  end

  def gets_damage(damage_number)
    @life_points -= damage_number
    if @life_points <=0
      puts "#{@name} a  été tué"
    end
  end

  def attacks(other_player)
    if @life_points > 0 && other_player.life_points > 0
      hit = compute_damage
      puts "#{@name} attaque #{other_player.name}"
      puts "Il lui a infligé #{hit} points de vie"
      other_player.gets_damage(hit)
    end 
  end 

  def compute_damage
    return rand(1..6)
  end 

end 

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name)
    @name = name
    @life_points = 100
    @weapon_level = 1
  end

  def show_state
    if @life_points > 0
      puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
    else 
      puts "#{@name} n'a de plus point de vie"
    end 
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end 

  def search_weapon
    new_weapon = rand(1..6)
    puts "Tu as une arme de niveau #{new_weapon}"
    if new_weapon > @weapon_level
      @weapon_level = new_weapon
      puts "Youhou ! Elle est meilleure que ton arme actuelle : tu la prends"
    else
      puts "Elle n'est pas mieux que ton arme actuelle"
    end
  end

  def search_health_pack
    health_pack = rand(1..6)
    if (health_pack == 1)
      puts "Tu n'as rien trouvé"
    
    elsif (health_pack >= 2) && (health_pack <= 5)
      if @life_points + 50 > 100
        @life_points = 100
      else 
        @life_points += 50
      end 
      puts "Bravo tu as trouvé un pack de +50 points de vie"
      
    elsif (health_pack == 6)
      if @life_points + 80 > 100
        @life_points = 100
      else 
        @life_points += 80
        puts "Waoww, tu as trouvé un pack de +80 points de vie"
      end
    end 
  end 
end 