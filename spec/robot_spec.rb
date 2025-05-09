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
      expect(robot.facing).to eq("NORTH")
    end
  end

  describe "#place" do
    it "places the robot with a valid position and facing" do
      expect(robot.place(1, 1, "NORTH")).to be true
      expect(robot.place(2, 3, "SOUTH")).to be true
      expect(robot.place(3, 4, "EAST")).to be true
      expect(robot.place(0, 0, "WEST")).to be true
      expect(robot.placed?).to be true
    end

    it "sets the position and facing when valid" do
      expect(robot.place(1, 2, "NORTH")).to be true
      expect(robot.x).to eq(1)
      expect(robot.y).to eq(2)
      expect(robot.facing).to eq("NORTH")
      expect(robot.placed?).to be true
    end

    it "doesn't place the robot with a invalid position" do
      expect(robot.place(-1, 0, "NORTH")).to be false
      expect(robot.place(0, -1, "SOUTH")).to be false
      expect(robot.place(5, 0, "EAST")).to be false
      expect(robot.place(0, -5, "WEST")).to be false
      expect(robot.placed?).to be false
    end

    it "doesn't place the robot with a invalid facing" do
      expect(robot.place(0, 0, "UNKNOWN")).to be false
      expect(robot.place(0, 0, "")).to be false
      expect(robot.placed?).to be false
    end
  end

  describe "#move" do
    context "robot has not been placed " do
      it "is ignored" do
        expect { robot.move }.not_to change { [robot.x, robot.y, robot.facing] }
      end
    end

    context "robot has been placed" do
      before { robot.place(0, 0, "NORTH") }

      it "moves north" do
        robot.place(0, 0, "NORTH")
        expect(robot.move).to be true
        expect(robot.x).to eq(0)
        expect(robot.y).to eq(1)
      end

      it "moves south" do
        robot.place(4, 4, "SOUTH")
        expect(robot.move).to be true
        expect(robot.x).to eq(4)
        expect(robot.y).to eq(3)
      end

      it "moves east" do
        robot.place(0, 0, "EAST")
        expect(robot.move).to be true
        expect(robot.x).to eq(1)
        expect(robot.y).to eq(0)
      end

      it "moves west" do
        robot.place(4, 4, "WEST")
        expect(robot.move).to be true
        expect(robot.x).to eq(3)
        expect(robot.y).to eq(4)
      end

      it "ignores move north off the table" do
        robot.place(4, 4, "NORTH")
        expect(robot.move).to be false
        expect(robot.x).to eq(4)
        expect(robot.y).to eq(4)
      end

      it "ignores move south off the table" do
        robot.place(0, 0, "SOUTH")
        expect(robot.move).to be false
        expect(robot.x).to eq(0)
        expect(robot.y).to eq(0)
      end

      it "ignores move east off the table" do
        robot.place(4, 4, "EAST")
        expect(robot.move).to be false
        expect(robot.x).to eq(4)
        expect(robot.y).to eq(4)
      end

      it "ignores move west off the table" do
        robot.place(0, 0, "WEST")
        expect(robot.move).to be false
        expect(robot.x).to eq(0)
        expect(robot.y).to eq(0)
      end
    end
  end

  describe "#right" do
    context "robot has not been placed " do
      it "is ignored" do
        expect { robot.right }.not_to change { [robot.x, robot.y, robot.facing] }
      end
    end

    context "robot has been placed" do
      before { robot.place(0, 0, "NORTH") }

      it "rotates from NORTH to EAST" do
        robot.place(0, 0, "NORTH")
        expect(robot.right).to be true
        expect { robot.x }.to_not change { [robot.x, robot.y] }
        expect(robot.facing).to eq("EAST")
      end

      it "rotates from EAST to SOUTH" do
        robot.place(0, 0, "EAST")
        expect(robot.right).to be true
        expect { robot.x }.to_not change { [robot.x, robot.y] }
        expect(robot.facing).to eq("SOUTH")
      end

      it "rotates from SOUTH to WEST" do
        robot.place(0, 0, "SOUTH")
        expect(robot.right).to be true
        expect { robot.x }.to_not change { [robot.x, robot.y] }
        expect(robot.facing).to eq("WEST")
      end

      it "rotates from WEST to NORTH" do
        robot.place(0, 0, "WEST")
        expect(robot.right).to be true
        expect { robot.x }.to_not change { [robot.x, robot.y] }
        expect(robot.facing).to eq("NORTH")
      end
    end
  end

  describe "#left" do
    context "robot has not been placed " do
      it "is ignored" do
        expect { robot.left }.not_to change { [robot.x, robot.y, robot.facing] }
      end
    end

    context "robot has been placed" do
      before { robot.place(0, 0, "NORTH") }

      it "rotates from NORTH to WEST" do
        robot.place(0, 0, "NORTH")
        expect(robot.left).to be true
        expect { robot.x }.to_not change { [robot.x, robot.y] }
        expect(robot.facing).to eq("WEST")
      end

      it "rotates from WEST to SOUTH" do
        robot.place(0, 0, "WEST")
        expect(robot.left).to be true
        expect { robot.x }.to_not change { [robot.x, robot.y] }
        expect(robot.facing).to eq("SOUTH")
      end

      it "rotates from SOUTH to EAST" do
        robot.place(0, 0, "SOUTH")
        expect(robot.left).to be true
        expect { robot.x }.to_not change { [robot.x, robot.y] }
        expect(robot.facing).to eq("EAST")
      end

      it "rotates from EAST to NORTH" do
        robot.place(0, 0, "EAST")
        expect(robot.left).to be true
        expect { robot.x }.to_not change { [robot.x, robot.y] }
        expect(robot.facing).to eq("NORTH")
      end
    end
  end
end
