require 'board'
describe Board do
  let(:ship) { double :ship, coordinates: [] }
  let(:shipklass) { double :shipklass}

  it "can place a ship on it" do
    subject.place(Boat, 1, 'A1', :S)
    expect(subject.ships).to include(an_instance_of(Boat))
  end

  it "can report :hit" do
    subject.place(Boat, 1, 'A1', :S)
    allow(ship).to receive(:coordinates).and_return('A1')
    allow(ship).to receive(:was_hit)
    expect(subject.receive_a_hit('A1')).to eq(:hit)
  end

  it "can report :hit when the ship size is greater than 1" do
    player = Player.new
    player.board.place(Boat, 2, 'E1', :E)
    expect(player.fire(player, 'F1')).to eq(:hit)
  end

  it "can report :miss" do
    subject.place(Boat, 1, 'A1', :S)
    allow(ship).to receive(:position).and_return('A1')
    allow(ship).to receive(:was_hit)
    expect(subject.receive_a_hit('A2')).to eq(:miss)
  end

  it "reports if all ships are sunk" do
    subject.place(Boat, 1, 'A1', :S)
    allow(ship).to receive(:position).and_return('A1')
    allow(ship).to receive(:was_hit)
    subject.receive_a_hit('A1')
    allow(ship).to receive(:sunk?).and_return(true)
    expect(subject).to be_all_sunk
  end

  it "reports if not all ships are sunk" do
    subject.place(Boat, 1, 'A1', :S)
    allow(ship).to receive(:position).and_return('A1')
    allow(ship).to receive(:was_hit)
    subject.receive_a_hit('A2')
    allow(ship).to receive(:sunk?).and_return(false)
    expect(subject).not_to be_all_sunk
  end

  it "raises an error if ships are overlapping" do
    subject.place(Boat, 1, 'B10', :S)
    expect { subject.place(Boat, 2, 'B10', :W) }.to raise_error ("Ship overlapping")
  end
end



# Version 'Skateboard'
# describe Board do
#   let(:ship) { double :ship }
#
#   it "can place a ship on it" do
#     expect(subject.place(ship)).to include(ship)
#   end
# end
