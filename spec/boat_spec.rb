require 'boat'

describe Boat do

  let(:ship) { Boat.new(1, 'A1', :S) }

  it "increases number of hits when hit" do
    expect{ ship.was_hit }.to change { ship.on_target }.by(1)
  end

  it "is not sunk when created" do
    expect(ship).not_to be_sunk
  end

  it "is sunk when it gets hit" do
    ship.was_hit
    expect(ship).to be_sunk
  end


  it "can face South" do
    ship = Boat.new(2, 'A1', :S)
    board = double :board
    allow(board).to receive(:place).and_return(['A1', 'A2'])
    board.place(ship)
    expect(ship.coordinates).to match_array(['A1', 'A2'])
  end

  it "can face North" do
    ship = Boat.new(2, 'A10', :N)
    board = double :board
    allow(board).to receive(:place).and_return(['A10', 'A9'])
    board.place(ship)
    expect(ship.coordinates).to match_array(['A9', 'A10'])
  end

  it "can face East" do
    ship = Boat.new(2, 'A10', :E)
    board = double :board
    allow(board).to receive(:place).and_return(['A10', 'B10'])
    board.place(ship)
    expect(ship.coordinates).to match_array(['A10', 'B10'])
  end

  it "can face West" do
    ship = Boat.new(2, 'B10', :W)
    board = double :board
    allow(board).to receive(:place).and_return(['A10', 'B10'])
    board.place(ship)
    expect(ship.coordinates).to match_array(['A10', 'B10'])
  end

  it "raises an error if ship is out of bounds" do
    expect { Boat.new(2, 'B10', :S) }.to raise_error ("Out of bounds")
  end

end
