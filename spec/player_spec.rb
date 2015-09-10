require 'player'

describe Player do
<<<<<<< HEAD
=======

  # it "can place a ship on the board" do
  #   board = double :board
  #
  #   shipklass = double :shipklass, new: :ship
  #   allow(board).to receive(:place).and_return([:ship])
  #   player = Player.new(board)
  #   expect(player.place(shipklass, 'A1', :E)).to include(:ship)
  # end
>>>>>>> 588a445... Practicing: Added direction & bounds
  context "When hit" do
    it "is stored in hits if hit" do
      board = double :board
      player = Player.new(board)
      allow(board).to receive(:receive_a_hit).and_return(:hit)
      player.fire(player, 'A1')
      expect(player.hits).to include('A1')
    end

    it "is stored in misses if miss" do
      board = double :board
      player = Player.new(board)
      allow(board).to receive(:receive_a_hit).and_return(:miss)
      player.fire(player, 'A2')
      expect(player.misses).to include('A2')
    end
  end
end
