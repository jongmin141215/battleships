require 'player'

describe Player do
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
