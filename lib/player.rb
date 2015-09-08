require_relative 'board'

class Player
  attr_reader :board
  def initialize(boardklass)
    @board = boardklass.new
  end
  def place(ship, position, direction)
    board.place(ship, position, direction)
  end
  def receive_hit(position)
    board.ships.last.position
  end
end
