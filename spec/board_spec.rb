require 'board'
describe Board do
  it "has default size 10 by 10 when created" do
    expect(subject.cells).to eq(Array.new(10) { Array.new(10) })
  end

  it "has size 5 by 5 when created with parameter 5" do
    expect(Board.new(5).cells).to eq(Array.new(5) { Array.new(5) })
  end

  it "has no ships when created" do
    expect(subject.ships).to be_empty
  end
  context "When placing a ship horizontally" do
    before(:each) do
      ship = double :ship
      subject.place_ship(:ship, 0, 0, true)
    end
    it "add it to the ship list" do
      expect(subject.ships).to include(:ship)
    end

    it "marks the relevant cells as occupied" do
      expect(subject.cells[0][0]).not_to eq(nil)
      expect(subject.cells[1][0]).not_to eq(nil)
    end
  end

  context "When placing a ship vertically" do
    before(:each) do
      ship = double :ship
      subject.place_ship(:ship, 0, 0, false)
    end
    it "add it to the ship list" do
      expect(subject.ships).to include(:ship)
    end

    it "marks the relevant cells as occupied" do
      expect(subject.cells[0][0]).not_to eq(nil)
      expect(subject.cells[0][1]).not_to eq(nil)
    end
  end
end
