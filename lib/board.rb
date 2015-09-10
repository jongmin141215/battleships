require_relative 'boat'

class Board

  attr_reader :ships

  def initialize
    @ships = []
  end

  # def grid
  #   n = (1..10).to_a
  #   a = ('A'..'J').to_a
  #   grid = n.map { |n| p a.map { |a| a + n.to_s } }
  # end

  def place(ship)
    check(ship)
    ships << ship
  end

  def check(ship)
    all_ships = []
    ships.each do |boat|
      all_ships << boat.coordinates
    end
    ship.coordinates.map do |c|
      if all_ships.flatten.include?(c)
        fail 'Ship overlapping'
      end
    end
  end

  def receive_a_hit(coord)
    ships.each do |ship|
      if ship.coordinates.include?(coord)
        ship.was_hit
        return :hit
      end
    end
    :miss
  end

  def all_sunk?
    sunk_array = ships.map { |ship| ship.sunk? }
    sunk_array.include?(false) ? false : true
  end
end

b = Board.new
b.grid

# Version 'Skateboard'
# class Board
#   def initialize
#     @ships = []
#   end
#   def place(ship)
#     @ships << ship
#   end
# end
