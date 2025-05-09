class Robot
  FACINGS = ["NORTH", "SOUTH", "EAST", "WEST"].freeze

  attr_reader :x, :y, :facing, :table

  def initialize(table)
    @table = table
    @x = 0
    @y = 0
  end

  def place(x, y, facing)
    return false unless table.position_valid?(x, y)
    return false unless FACINGS.include?(facing)

    @x = x
    @y = y
    @facing = facing
    true
  end
end
