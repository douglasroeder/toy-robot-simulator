require 'spec_helper'

RSpec.describe ToyRobot do
  before :each do
    @robot = ToyRobot.new
  end

  describe 'moving the robot around' do
    it 'should move like the example 1' do
      @robot.place 0, 0, :north
      @robot.move

      expect(@robot.report).to be_eql('0,1,north')
    end

    it 'should move like the example 2' do
      @robot.place 0, 0, :north
      @robot.left

      expect(@robot.report).to be_eql('0,0,west')
    end

    it 'should move like the example 3' do
      @robot.place 1, 2, :east
      @robot.move
      @robot.move
      @robot.left
      @robot.move

      expect(@robot.report).to be_eql('3,3,north')
    end

    it 'should move right example' do
      @robot.place 0, 0, :north
      @robot.right
      @robot.move

      expect(@robot.report).to be_eql('1,0,east')
    end

    it 'should move and avoid negative coordinates' do
      @robot.place 0, 0, :south
      @robot.move

      expect(@robot.report).to be_eql('0,0,south')
    end
  end

  describe 'trying to move around without placing a position' do
    it 'should raise an exception on the move command' do
      expect { @robot.move }
        .to raise_error(Robot::PlacementNotInitialized)
    end

    it 'should raise an exception on the orientation change' do
      expect { @robot.right }
        .to raise_error(Robot::PlacementNotInitialized)
    end
  end
end
