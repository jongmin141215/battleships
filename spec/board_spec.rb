require 'board'
describe Board do
  let(:ship) { double :ship, position: 'A1' }

  it "can place a ship on it" do
    subject.place(ship)
    expect(subject.ships).to include(ship)
  end

  it "can report :hit" do
    subject.place(ship)
    expect(subject.receive_a_hit('A1')).to eq(:hit)
  end

  it "can report :miss" do
    subject.place(ship)
    expect(subject.receive_a_hit('A2')).to eq(:miss)
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
