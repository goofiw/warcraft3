# http://classic.battle.net/war3/human/units/footman.shtml

class Footman < Unit
    #attr_reader :attack_power, :health_points
  def initialize
		super(60, 10)
    # Also also give code outside this class access to these variables (via attr_reader, attr_writer or attr_accessor)
  end
  
  def attack_power
  	ap
  end
end
