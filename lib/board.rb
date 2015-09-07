require 'ship'
class Board
  attr_reader :cells, :ships

  def initialize(size = 10)
    @cells = Array.new(size) { Array.new(size) }
    @ships = []
  end

  def place_ship(ship, x, y, horizontal)
    @ships << ship
    if horizontal
      0.upto(ship.size-1) do |i|
        cells[x + i][y] = ship
      end
    else
      0.upto(ship.size-1) do |j|
        cells[x][y+j] = ship
      end
    end
  end


end
