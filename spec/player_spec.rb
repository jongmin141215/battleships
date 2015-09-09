require 'player'

describe Player do

  let(:shipklass) { double :shipklass }
  let(:ship) { double :ship }
  let(:boardklass) { double :boardklass, new: board, board: :place }
  let(:board) { double :board, ships: ship, count: 1 }
  #
  # it "can place a ship on the board" do
  #   expect{Player.new(boardklass).place(shipklass, 'E9', :N}.to change(Player.new(boardklass).board.ships.count}.by(1)
  # end
  #
  # it "can display information about the ships on the board" do
  #   Player.new(boardklass).place(shipklass, 'E9', :N)
  #   expect(Player.new(baordklass).board.ships).to include(ship)
  # end

  it "can place a ship on the board" do
    player = Player.new(Board)
    expect{player.place(Ship, 'E9', :N)}.to change{player.board.ships.count}.by(1)
  end

  describe "#receive_hit(position)" do
    context "When hit" do
      it "displays :hit" do
        subject.place(Ship, 'C4', :N)
        expect(subject.receive_hit('C4')).to eq(:hit)
      end
    end
    context "When not hit" do
      it "displays :miss" do
        subject.place(Ship, 'C4', :N)
        expect(subject.receive_hit('B4')).to eq(:miss)
      end
    end
  end
end
