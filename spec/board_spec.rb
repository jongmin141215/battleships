require 'board'
describe Board do

  let(:ship) { double :ship, coordinates: [] }

  it "can place a ship" do
    subject.place("sub", 2, "A1", :S)
    expect(subject.ships[0]).to be_kind_of Boat
  end

  it "can report :hit" do
    subject.place("sub", 2, "A1", :S)
    expect(subject.receive_a_hit('A1')).to eq(:hit)
  end

  it "can report :miss" do
    subject.place("sub", 2, "A1", :S)
    expect(subject.receive_a_hit('A3')).to eq(:miss)
  end

  it "reports if all ships are sunk" do
    subject.place("sub", 1, "A1", :S)
    subject.receive_a_hit('A1')
    expect(subject.all_sunk?).to eql(true)
  end

  it "reports if not all ships are sunk" do
    subject.place(ship2, 2, "A1", :S)
    subject.receive_a_hit('A1')
    expect(subject.all_sunk?).to eql(false)
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
