require 'boat'

describe Boat do

  let(:ship) { Boat.new('ship', 1, 'A1', :S) }

  it "increases number of hits when hit" do
    expect{ ship.was_hit }.to change { ship.hits }.by(1)
  end

  it "is not sunk when created" do
    expect(ship).not_to be_sunk
  end

  it "is sunk when it gets hit" do
    ship.was_hit
    expect(ship).to be_sunk
  end

end
