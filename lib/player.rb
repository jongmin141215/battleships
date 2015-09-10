require_relative 'board'

class Player

  attr_reader :board, :hits, :misses

  def initialize(board = Board.new)
    @board = board
    @hits = []
    @misses = []
  end

  def place(name, size, position, direction)
    board.place(Boat.new(name, size, position, direction))
  end

  def receive_hit(coord)
    if board.receive_a_hit(coord) == :hit
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
