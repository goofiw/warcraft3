require_relative 'spec_helper'

#barracks hp 500 receive half damage(ceil)
describe Barracks do
	
	describe "initialization" do

    before :each do 
		  @barracks = Barracks.new	
		end

		it "has 500 hp" do 
		  expect(@barracks.hp).to eql 500
		end		

		it "takes half damage from units of type infantry" do 
			footie = Footman.new
			footie.attack!(@barracks)
			expect(@barracks.hp).to eql 495
		end

		it "Starts out with 500 lumber" do 
      expect(@barracks.lumber).to eql 500
		end
	end
end

# implement dead?  (hp<1)

describe Unit do
  
  before :each do 
    @unit = Unit.new(20, 5) 
  end

	describe "dead?" do 
		it "should return true if unit has less than 1 hp" do 
      @unit.should_receive(:hp).and_return(-1)
      #puts @unit.hp
      expect(@unit.dead?).to be_truthy
		end

		it "should return false if unit has >0 hp" do 
      @unit.should_receive(:hp).and_return(1)
      #puts @unit.hp
      expect(@unit.dead?).to be_falsey
		end

		it "dead units can not be attacked" do 
			@unit.should_receive(:dead?).and_return(true)
			expect(Unit.new(1,1).attack!(@unit)).to be_falsey
		end

		it "dead units cannot attack" do 
			@unit.should_receive(:dead?).and_return(true)
			expect(@unit.attack!(Unit.new(1,1))).to be_falsey

		end

	end

end


# add 500 lumber to barracks
describe SiegeEngine do 
  
  before :each do 
  	@engine = SiegeEngine.new
  	@barracks = Barracks.new
  end

	describe "#new" do 

		it "should deal full damage to buildings" do 
			
			@engine.attack!(@barracks)
			expect(@barracks.hp).to eql 450
		end

		it "should not be able to attack non-buildings" do
			expect(@engine.attack!(Footman.new)).to be_falsey
		end

		it "can't train when not enough lumber" do 
      @barracks.should_receive(:can_train_siege_engine?).and_return(false)
      expect(@barracks.train_siege_engine).to be_falsey
    end

    it "can train when enough resources" do 
      @barracks.should_receive(:can_train_siege_engine?).and_return(true)
      expect(@barracks.train_siege_engine).to be_a(SiegeEngine)
    end
  end
end


#seige engine  not attack units
#ap: 50 hp:400
# cost 200 gold 60 lumber 3 food