class SiegeEngine < Unit

	def initialize
		super(400, 50)
		@type = "siege"
	end

	def attack!(enemy)
		return false if enemy.dead? || dead? || enemy.type != "building"
    enemy.damage(@ap, true)
  end

end