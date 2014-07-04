require 'spec_helper'

RSpec.describe Robot::Movement do
  let(:subject_class) { Class.new }
  let(:object) { subject_class.new }

  before :each do
    subject_class.class_eval { include Robot::Movement }
  end

  it 'should move to north' do
    new_position = object.make_move([0, 0], :north)

    expect(new_position).to be_eql([0, 1])
  end

  it 'should move to east' do
    new_position = object.make_move([0, 0], :east)

    expect(new_position).to be_eql([1, 0])
  end

  it 'should move to south' do
    new_position = object.make_move([2, 2], :south)

    expect(new_position).to be_eql([2, 1])
  end
end
