require 'spec_helper'

RSpec.describe Robot::Position do
  let(:table_size) { [5, 5] }
  let(:subject_class) { Class.new }
  let(:object) { subject_class.new }

  before :each do
    subject_class.class_eval { include Robot::Position }
  end

  context 'setting coordinates' do
    before :each do
      object.position(1, 2, table_size)
    end

    it 'should the x coordinate be setted' do
      expect(object.x).to be_eql(1)
    end

    it 'should the x coordinate be setted' do
      expect(object.y).to be_eql(2)
    end
  end

  context 'checking defined position' do
    describe 'when not setting' do
      it 'should not be defined' do
        expect(object.defined_position?).to be_eql(false)
      end
    end

    describe 'when setting all coordinates' do
      it 'should be defined' do
        object.position(0, 0, table_size)

        expect(object.defined_position?).to be_eql(true)
      end
    end
  end
end
