require 'spec_helper'

RSpec.describe Table do
  let(:table_size) { [5, 5] }

  before :each do
    @table = Table.new(table_size)
  end

  it 'should retrieve the table size' do
    expect(@table.size).to be_eql(table_size)
  end
end
