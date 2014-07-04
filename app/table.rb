# Table is the space dimension available for the robot to move
class Table
  # Retrieve the table size
  # @return [Array] the table size
  attr_reader :size

  # Initializes a new instance of Table class
  # @param size [Array] sets the table size. Ex: [5, 5]
  def initialize(size = [5, 5])
    @size = size
  end
end
