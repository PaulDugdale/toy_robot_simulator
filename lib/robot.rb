class Robot
  FACINGS = ["NORTH", "EAST", "SOUTH", "WEST"].freeze

  # 0,0 is in the south-west corner
  OFFSETS = {
    "NORTH" => {x: 0, y: 1},
    "SOUTH" => {x: 0, y: -1},
    "EAST" => {x: 1, y: 0},
    "WEST" => {x: -1, y: 0}
  }.freeze

  attr_reader :x, :y, :facing, :table, :placed

  def initialize(table)
    @table = table
    @x = 0
    @y = 0
    @facing = "NORTH"
    @placed = false
  end

  def place(x, y, facing)
    return false unless table.position_valid?(x, y)
    return false unless FACINGS.include?(facing)

    @x = x
    @y = y
    @facing = facing
    @placed = true
    true
  end

  def placed?
    @placed
  end

  def move
    return false unless placed?

    offset = OFFSETS[facing]
    return false unless offset

    new_x = @x + offset[:x]
    new_y = @y + offset[:y]
    return false unless table.position_valid?(new_x, new_y)

    @x = new_x
    @y = new_y

    true
  end

  def right
    return false unless placed?

    index = FACINGS.index(@facing)
    @facing = FACINGS[(index + 1) % FACINGS.size]
    true
  end

  def left
    return false unless placed?

    index = FACINGS.index(@facing)
    @facing = FACINGS[(index - 1) % FACINGS.size]
    true
  end

  def report
    return nil unless placed?
    "#{@x},#{@y},#{@facing}"
  end
end
