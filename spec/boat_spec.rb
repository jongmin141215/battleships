require 'boat'

describe Boat do

  let(:ship) { Boat.new('ship', 1, 'A1', :S) }
  let(:submarine) { Boat.new('submarine', 2, 'A1', :S) }


  it "increases number of hits when hit" do
    expect{ ship.was_hit }.to change { ship.on_target }.by(1)
  end

  it "is not sunk when created" do
    expect(ship).not_to be_sunk
  end

  it "is sunk when it gets hit" do
    2.times { submarine.was_hit }
    expect(submarine).to be_sunk
  end

  it "should bring up error if created out of bounds" do
    expect{Boat.new('battleship', 3, 'A1', :N)}.to raise_error "boat out of bounds"
  end

  

end
