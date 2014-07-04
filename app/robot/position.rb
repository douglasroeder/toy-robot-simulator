module Robot
  # The robot position is a x,y coordinate, is used to determinate where the
  # robot is in the table
  module Position
    # Sets/Gets for x coordinate
    attr_accessor :x

    # Sets/Gets for y coordinate
    attr_accessor :y

    # Define current robot position
    def position(x, y, table_size)
      self.x, self.y = x, y if valid_position?(x, y, table_size)
    end

    # Get the current robot position
    def current_position
      [x, y]
    end

    # Check if robot position is already defined
    def defined_position?
      !(x.nil? && y.nil?)
    end

    private

    def valid_position?(x, y, table_size)
      (
        (x >= 0) && (x <= table_size[0])
      ) && (
        (y >= 0) && (y <= table_size[1])
      )
    end
  end
end
