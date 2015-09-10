require_relative 'boat'

class Board

  attr_reader :ships, :damage, :near_miss

  def initialize
    @ships = []
    @damage = []
    @near_miss = []
  end

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
    ships.each do |boat|
      if boat.coordinates.include?(coord)
        boat.was_hit
        @damage << coord
        if boat.sunk?
          puts "sunk..."
        else
          puts "Not sunk..."
        end
        return :hit
      end
    end
    @near_miss << coord
    :miss
  end

  def all_sunk?
    sunk_array = ships.map { |ship| ship.sunk? }
    sunk_array.include?(false) ? false : true
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
