

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
    enemy.damage(@ap)
  end

  def damage(dmg)
    @hp -= dmg
  end

end