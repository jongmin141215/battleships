require_relative 'board'

class Player

  attr_reader :board, :hits, :misses

  def initialize(board = Board.new)
    @board = board
    @hits = []
    @misses = []
  end

  def place(shipklass, size, position, direction)
    board.place(shipklass.new(size, position, direction))
  end

  def fire(opponent, coord)
    if opponent.board.receive_a_hit(coord) == :hit
      @hits << coord
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
