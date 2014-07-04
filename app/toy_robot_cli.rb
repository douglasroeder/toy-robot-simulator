require File.expand_path('../toy_robot', __FILE__)

# Client interface for Toy Robot Simulator
class ToyRobotCli
  # Header information
  HEADER = %(Welcome to Toy Robot!
=====================
Commands: PLACE, MOVE, LEFT, RIGHT, REPORT, EXIT
------------------------------------------------)

  def initialize
    @toy_robot = ToyRobot.new
  end

  # Start point for the client, it prints the header and waits for user
  # input
  def execute
    puts HEADER

    loop do
      cmd = gets.chomp

      if valid_command?(cmd)
        execute_command(cmd)
      else
        puts 'Not valid command'
      end
    end
  end

  private

  # Parse and execute the interface commands
  # @return [nil]
  def execute_command(cmd)
    command, args = parse_input(cmd)

    case command
    when :place
      place_robot(args)
    when :move, :left, :right
      @toy_robot.send(command)
    when :report
      puts @toy_robot.report
    when :exit
      puts 'Leaving...'

      exit
    end
  rescue => e
    puts "Error: #{e.message}"
  end

  # Parse the place arguments and execute the command
  # @param args [String] the place arguments
  #   Ex: '1,1,north'
  # @return [nil]
  def place_robot(args)
    x, y, direction = args.split(',')
    [x, y, direction].each do |arg|
      fail 'Missing argument' if arg.to_s.empty?
    end

    @toy_robot.place x.strip.to_i, y.strip.to_i,
                     direction.strip.downcase.to_sym
  end

  # Parse the user input command
  # @param input [String] command entered by user
  # @return [Array] a symbolized command and arguments if any
  #   Ex: [:place, '1,1,north']
  def parse_input(input)
    match = input.match(/^(PLACE|MOVE|LEFT|RIGHT|REPORT|EXIT)(.*)/i)

    command, args = match.captures
    args.strip!

    [command.downcase.to_sym, args]
  end

  # Validates the presence of valid commands
  # @param cmd [String] command entered by user
  # @return [Boolean] true if a valid command is present
  def valid_command?(cmd)
    cmd.scan(/^(PLACE|MOVE|LEFT|RIGHT|REPORT|EXIT)(.*)/i).any?
  end
end
