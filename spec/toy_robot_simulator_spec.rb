require "toy_robot_simulator"

RSpec.describe ToyRobotSimulator do
  subject(:simulator) { ToyRobotSimulator.new }

  describe "#execute_command" do
    it "parses the PLACE command" do
      expect(simulator.execute_command("PLACE 0,0,NORTH")).to be true
      expect(simulator.execute_command("REPORT")).to eq("0,0,NORTH")
    end

    it "parses the MOVE command" do
      expect(simulator.execute_command("PLACE 0,0,NORTH")).to be true
      expect(simulator.execute_command("MOVE")).to be true
      expect(simulator.execute_command("REPORT")).to eq("0,1,NORTH")
    end

    it "parses the RIGHT command" do
      expect(simulator.execute_command("PLACE 0,0,NORTH")).to be true
      expect(simulator.execute_command("RIGHT")).to be true
      expect(simulator.execute_command("REPORT")).to eq("0,0,EAST")
    end

    it "parses the LEFT command" do
      expect(simulator.execute_command("PLACE 0,0,NORTH")).to be true
      expect(simulator.execute_command("LEFT")).to be true
      expect(simulator.execute_command("REPORT")).to eq("0,0,WEST")
    end
  end
end
