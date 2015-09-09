require_relative 'board'

class Player
  attr_reader :board

  def initialize(boardklass = Board)
    @board = boardklass.new
  end
  def place(shipklass, position, direction)
    board.place(shipklass, position, direction)
  end
  def receive_hit(position1)
    # implement this method
    board.ships.each do |ship|
      puts ship.position
      return :hit if ship.position == position1
    end
    :miss
  end
end
