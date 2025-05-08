require "robot"
require "table"

RSpec.describe Robot do
  let(:table) { Table.new }
  subject(:robot) { Robot.new(table) }

  describe "#initialize" do
    it "has default values" do
      expect(robot.table).to be(table)
      expect(robot.x).to eq(0)
      expect(robot.y).to eq(0)
    end
  end
end
