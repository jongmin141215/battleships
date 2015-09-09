require_relative 'ship'

class Board
  attr_reader :ships
  def initialize
    @ships = []
  end
  def place(shipklass, position, direction)
    @ships << shipklass.new(position, direction)
  end
end

# Version 'Skateboard'
# class Board
#   def initialize
#     @ships = []
#   end
#   def place(ship)
#     @ships << ship
#   end
# end
