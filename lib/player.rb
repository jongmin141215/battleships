require_relative 'board'

class Player

  attr_reader :board, :hits, :misses

  def initialize(board = Board.new)
    @board = board
    @hits = []
    @misses = []
  end

  def place(shipklass, position, direction)
    board.place(shipklass.new(position, direction))
  end

  def receive_hit(coord)
    if board.receive_a_hit(coord) == :hit
      @hits << coord
      :hit
    else
      @misses << coord
      :miss
    end
  end


end
