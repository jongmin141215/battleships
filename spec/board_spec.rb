require 'board'
describe Board do
  let(:ship) { double :ship }
  let(:shipklass) { double :shipklass, new: :ship}

  it "can place a ship on it" do
    expect(subject.place(shipklass, 'D6', :W)).to include(:ship)
  end

  it 'stores the ship placed on the board' do
    subject.place(shipklass, 'B8', :E)
    expect(subject.ships).to include(:ship)
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
