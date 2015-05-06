class Barracks

  attr_reader :gold, :food
  
	def initialize
    @gold = 1000
    @food = 80
    @footman_cost = { gold: 135, food: 2 }
    @peasant_cost = { gold: 90, food: 5 }
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
end
