class Robot
  attr_reader :x, :y, :table

  def initialize(table)
    @table = table
    @x = 0
    @y = 0
  end
end
