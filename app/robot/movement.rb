module Robot
  # Adds a movement behaviour to the robot. Responsible to move the robot
  # forward on the direction he is facing
  module Movement
    # Rules applied when executing the robot movement
    RULES = {
      north: { x: '=', y: '+' },
      east: { x: '+', y: '=' },
      south: { x: '=', y: '-' },
      west: { x: '-', y: '=' }
    }

    # Change current position based on the direction the robot is facing
    #
    # @param current_position [Array] the actual robot position
    # @param direction [Symbol] the actual robot direction.
    #   Ex: :north, :east, :south, :west
    # @return [Array] the new robot position
    def make_move(current_position, direction)
      new_position = current_position.dup
      rule = RULES[direction.to_sym]

      apply_rule(rule, new_position)
    end

    private

    def apply_rule(rule, movement)
      [rule[:x], rule[:y]].each_with_index do |coord_rule, i|
        case coord_rule
        when '+'
          movement[i] += 1
        when '-'
          movement[i] -= 1
        end
      end

      movement
    end
  end
end
