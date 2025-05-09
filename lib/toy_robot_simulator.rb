require_relative "table"
require_relative "robot"

class ToyRobotSimulator
  def initialize
    @table = Table.new
    @robot = Robot.new(@table)
  end

  def execute_command(str)
    parts = str.strip.split
    command = parts[0]
    args_str = parts[1]

    case command
    when "PLACE"
      args = args_str.split(",")
      x = Integer(args[0])
      y = Integer(args[1])
      facing = args[2]
      @robot.place(x, y, facing)
    when "MOVE"
      @robot.move
    when "LEFT"
      @robot.left
    when "RIGHT"
      @robot.right
    when "REPORT"
      @robot.report
    end
  end
end
