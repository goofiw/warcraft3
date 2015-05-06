class Barracks < Unit

  attr_reader :gold, :food, :lumber, :building, :type
  
	def initialize
		super(500,0)
		@type = "building"
    @gold = 1000
    @food = 80
    @lumber = 500
    @footman_cost = { gold: 135, food: 2 }
    @peasant_cost = { gold: 90, food: 5 }
    @siege_engine_cost = { gold: 200, lumber: 60, food: 3 }
  end
  # WOULD FAIL IN REAL LIFE
  def can_train_footman?
    return false if gold < @footman_cost[:gold] || food < @footman_cost[:food]
    return true
  end
  

  def train_footman
  	if can_train_footman?
  		#binding.pry
  	  @gold = @gold - @footman_cost[:gold]
  	  @food = @food - @footman_cost[:food]
  	  Footman.new 
  	end
  end

  def can_train_peasant? 
  	return false if gold < @peasant_cost[:gold] || food < @peasant_cost[:food]
  	return true
  end

  def train_peasant
  	if can_train_peasant?
  		@gold = @gold - @peasant_cost[:gold]
  	  @food = @food - @peasant_cost[:food]
  	  Peasant.new
  	end
  end

  def can_train_siege_engine? 
  	return false if gold < @siege_engine_cost[:gold] || food < @siege_engine_cost[:food] || lumber < @siege_engine_cost[:lumber]
  	return true
  end

  def train_siege_engine
  	if can_train_siege_engine?
  		@gold = @gold - @siege_engine_cost[:gold]
  	  @food = @food - @siege_engine_cost[:food]
  	  @lumber = @lumber - @siege_engine_cost[:lumber]
  	  SiegeEngine.new
  	end
  end

  def damage(dmg, siege=false)
  	if siege 
  		@hp -= dmg
  	else
  		@hp -= dmg/2.0.ceil
    end
  end

end
