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



end

# Version 'Skateboard'
# describe Ship do
# end
