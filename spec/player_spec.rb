require 'player'

describe Player do

  # it "can place a ship on the board" do
  #   board = double :board
  #   allow(board).to receive(:place).and_return([:ship])
  #   player = Player.new(board)
  #   expect(player.place('Ship', 2, 'A1', :E)).to include(:ship)
  # end
  context "When hit" do
    it "is stored in hits if hit" do
      board = double :board
      player = Player.new(board)
      allow(board).to receive(:receive_a_hit).and_return(:hit)
      player.receive_hit('A1')
      expect(player.hits).to include('A1')
    end

    it "is stored in misses if miss" do
      board = double :board
      player = Player.new(board)
      allow(board).to receive(:receive_a_hit).and_return(:miss)
      player.receive_hit('A2')
      expect(player.misses).to include('A2')
    end
  end
end
