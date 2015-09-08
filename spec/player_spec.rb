require 'player'

describe Player do

  let(:shipklass) { double :shipklass, new: :ship, position: 'C4' }
  let(:ship) { double :ship }
  let(:boardklass) { double :boardklass, new: :board }
  let(:board) { double :board, place: 'hi' }

  it "can place a ship on the board" do
    expect(Player.new(boardklass).place(shipklass, 'C4', :N)).to include(:ship)
  end

  it "can display information about the ships on the board" do
    subject.place(shipklass, 'E9', :N)
    expect(subject.board.ships).to include(:ship)
  end


  # describe "#receive_hit(position)" do
  #   context "When hit" do
  #     it "displays :hit" do
  #       subject.place(shipklass, 'C4', :N)
  #       expect(subject.receive_hit('C4')).to eq(:hit)
  #     end
  #   end
  #   context "When not hit" do
  #     it "displays :miss" do
  #       subject.place(shipklass, 'C4', :N)
  #
  #       expect(subject.receive_hit('B4')).to eq(:miss)
  #     end
  #   end
  # end
end
