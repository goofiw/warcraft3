

class Unit
  
  attr_reader :hp, :ap
	def initialize(hp, ap)
		@hp = hp
		@ap = ap
	end

	def health_points
		@hp
	end

	def attack!(enemy)
		return false if enemy.dead? || dead?
    enemy.damage(@ap)
  end

  def damage(dmg)
  	return false if dead?
    @hp -= dmg
  end

  def dead?
  	hp <= 0 ? true : false
  end

end