require 'spec_helper'

RSpec.describe Robot::Orientation do
  let(:subject_class) { Class.new }
  let(:object) { subject_class.new }

  before :each do
    subject_class.class_eval { include Robot::Orientation }
    object.direction = :north
  end

  it 'should be facing north' do
    expect(object.direction).to be_eql(:north)
  end

  context 'when moving to left' do
    it 'should be facing west' do
      object.left

      expect(object.direction).to be_eql(:west)
    end
  end

  context 'when moving to right' do
    it 'should be facing east' do
      object.right

      expect(object.direction).to be_eql(:east)
    end
  end

  context 'when moving twice to right' do
    it 'should be facing south' do
      object.right
      object.right

      expect(object.direction).to be_eql(:south)
    end
  end
end
