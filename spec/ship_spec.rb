require 'ship'

describe Ship do

  it "increases number of hits when hit" do
    board = Board.new
    ship = Ship.new('A1', :N)
    hit_num = ship.hits
    board.place ship
    board.receive_a_hit('A1')
    expect(ship.hits).to eq(hit_num+1)
  end

  it "is not sunk when created" do
    ship = Ship.new('A1', :E)
    expect(ship).not_to be_sunk
  end

  it "is sunk when it gets hit" do
    ship = Ship.new('A1', :E)
    ship.was_hit
    expect(ship).to be_sunk
  end

end

# Version 'Skateboard'
# describe Ship do
# end
