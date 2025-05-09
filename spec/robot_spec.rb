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

  describe "#place" do
    it "places the robot with a valid position and facing" do
      expect(robot.place(1, 1, "NORTH")).to be true
      expect(robot.place(2, 3, "SOUTH")).to be true
      expect(robot.place(3, 4, "EAST")).to be true
      expect(robot.place(0, 0, "WEST")).to be true
    end

    it "sets the position and facing when valid" do
      expect(robot.place(1, 2, "NORTH")).to be true
      expect(robot.x).to eq(1)
      expect(robot.y).to eq(2)
      expect(robot.facing).to eq("NORTH")
    end

    it "doesn't place the robot with a invalid position" do
      expect(robot.place(-1, 0, "NORTH")).to be false
      expect(robot.place(0, -1, "SOUTH")).to be false
      expect(robot.place(5, 0, "EAST")).to be false
      expect(robot.place(0, -5, "WEST")).to be false
    end

    it "doesn't place the robot with a invalid facing" do
      expect(robot.place(0, 0, "UNKNOWN")).to be false
      expect(robot.place(0, 0, "")).to be false
    end
  end
end
