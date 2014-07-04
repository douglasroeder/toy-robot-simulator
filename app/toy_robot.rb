require File.expand_path('../robot/exceptions', __FILE__)
require File.expand_path('../robot/position', __FILE__)
require File.expand_path('../robot/orientation', __FILE__)
require File.expand_path('../robot/movement', __FILE__)
require File.expand_path('../table', __FILE__)

# Class that manage the full robot behaviour
class ToyRobot
  include Robot::Orientation
  include Robot::Movement
  include Robot::Position

  # Returns a new instance of ToyRobot and defines the table size
  def initialize(table = Table.new([4, 4]))
    @table = table
  end

  # Puts the robot on a exact location and direction
  #
  # @param x [Integer] x coordinate where the robot will be
  # @param y [Integer] y coordinate where the robot will be
  # @param orientation [Symbol] direction the robot is facing.
  #   Ex: :north, :east, :south, :west
  # @return [nil]
  def place(x, y, orientation)
    position(x, y, @table.size)
    self.direction = orientation.to_sym
  end

  # Make the robot moves on the table
  # @return [nil]
  def move
    check_placement

    new_position = make_move(current_position, direction)
    position(new_position[0], new_position[1], @table.size)
  end

  # Change the robot orientation to left
  # @return [nil]
  def left
    check_placement

    super
  end

  # Change the robot orientation to right
  # @return [nil]
  def right
    check_placement

    super
  end

  # Reports the current robot position and direction
  # @return [String] retrieve position and direction
  def report
    check_placement

    "#{x},#{y},#{direction}"
  end

  private

  def check_placement
    fail Robot::PlacementNotInitialized,
         'PLACE not defined' unless defined_position?
  end
end
