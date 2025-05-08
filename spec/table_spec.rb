require "table"

RSpec.describe Table do
  subject(:table) { Table.new }

  describe "#initialize" do
    it "has a dimension of 5x5" do
      expect(table.width).to eq(5)
      expect(table.height).to eq(5)
    end
  end

  describe "#position_valid?" do
    it "returns true when the position is valid" do
      expect(table.position_valid?(0, 0)).to be true
      expect(table.position_valid?(4, 4)).to be true
      expect(table.position_valid?(1, 3)).to be true
    end

    it "returns false when the position is out of bounds" do
      expect(table.position_valid?(-1, 0)).to be false
      expect(table.position_valid?(0, -1)).to be false
      expect(table.position_valid?(5, 0)).to be false
      expect(table.position_valid?(0, 5)).to be false
    end
  end
end
