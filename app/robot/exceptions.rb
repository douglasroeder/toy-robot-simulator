# Robot exceptions
module Robot
  # Exception raised when the robot placement was not set, there are some
  # instructions that will only work with the robot on the table.
  # Ex: You can't call MOVE before a PLACE command.
  PlacementNotInitialized = Class.new(StandardError)
end
