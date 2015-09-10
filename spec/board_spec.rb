require 'board'
describe Board do

  let(:ship) { double :ship, position: 'A1', sunk?: true,
    coordinates: ['A1'], was_hit: true }
  let(:ship2) { double :ship, position: 'A1', sunk?: false }


  it "can place a ship" do
    subject.place("sub", 2, "A1", :S)
    expect(subject.ships[0]).to be_kind_of Boat
  end

  it "can report :hit" do
    subject.place(ship)
    expect(subject.receive_a_hit('A1')).to eq(:hit)
  end

  it "can report :miss" do
    subject.place(ship)
    expect(subject.receive_a_hit('A2')).to eq(:miss)
  end

  it "reports if all ships are sunk" do
    subject.place(ship)
    expect(subject.all_sunk?).to eql(true)
  end

  it "reports if not all ships are sunk" do
    subject.place(ship2)
    expect(subject.all_sunk?).to eql(false)
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
