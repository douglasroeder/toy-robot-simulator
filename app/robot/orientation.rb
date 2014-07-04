module Robot
  # Adds an orientation behaviour to the Robot. Responsible for changing the
  # robot direction.
  module Orientation
    # Sets and retrieves the robot direction
    attr_accessor :direction

    # Possible robot directions
    DIRECTIONS = [:north, :east, :south, :west]

    # Changes the robot direction to left
    # @return [nil]
    def left
      if DIRECTIONS.first == DIRECTIONS[direction_index]
        self.direction = DIRECTIONS[-1]
      else
        self.direction = DIRECTIONS[direction_index - 1]
      end
    end

    # Changes the robot direction to right
    # @return [nil]
    def right
      if DIRECTIONS.last == DIRECTIONS[direction_index]
        self.direction = DIRECTIONS[0]
      else
        self.direction = DIRECTIONS[direction_index + 1]
      end
    end

    private

    def direction_index
      DIRECTIONS.index(direction)
    end
  end
end
