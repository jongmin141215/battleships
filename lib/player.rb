require_relative 'board'

class Player

  attr_reader :board, :hits, :misses

  def initialize(board = Board.new)
    @board = board
    @hits = []
    @misses = []
  end

<<<<<<< HEAD
  def fire(player, coord)
    if player.board.receive_a_hit(coord) == :hit
       @hits << coord
=======
  def place(shipklass, size, position, direction)
    board.place(shipklass.new(size, position, direction))
  end

  def receive_hit(coord)
    if board.receive_a_hit(coord) == :hit
      @hits << coord
>>>>>>> 588a445... Practicing: Added direction & bounds
      :hit

    elsif board.receive_a_hit(coord) == :miss
      @misses << coord
      :miss
    end
  end

  def lost?
    board.all_sunk?
  end


end
