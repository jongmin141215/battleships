require 'board'
describe Board do
  let(:ship) { double :ship, coordinates: [] }

  it "can place a ship on it" do
    subject.place(ship)
    expect(subject.ships).to include(ship)
  end

  it "can report :hit" do
    subject.place(ship)
    allow(ship).to receive(:position).and_return('A1')
    allow(ship).to receive(:was_hit)
    expect(subject.receive_a_hit('A1')).to eq(:hit)
  end

  it "can report :miss" do
    subject.place(ship)
    allow(ship).to receive(:position).and_return('A1')
    allow(ship).to receive(:was_hit)
    expect(subject.receive_a_hit('A2')).to eq(:miss)
  end

  it "reports if all ships are sunk" do
    subject.place(ship)
    allow(ship).to receive(:position).and_return('A1')
    allow(ship).to receive(:was_hit)
    subject.receive_a_hit('A1')
    allow(ship).to receive(:sunk?).and_return(true)
    expect(subject).to be_all_sunk
  end

  it "reports if not all ships are sunk" do
    subject.place(ship)
    allow(ship).to receive(:position).and_return('A1')
    allow(ship).to receive(:was_hit)
    subject.receive_a_hit('A2')
    allow(ship).to receive(:sunk?).and_return(false)
    expect(subject).not_to be_all_sunk
  end

  it "raises an error if ships are overlapping" do
    ship = Boat.new(2, 'B10', :W)
    subject.place(ship)
    expect { subject.place(Boat.new(2, 'B10', :W)) }.to raise_error ("Ship overlapping")
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
