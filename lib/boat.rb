class Boat

  attr_reader :position, :direction, :size, :hits, :coordinates

  def initialize(size, position, direction)
    @size = size
    @position = position
    @direction = direction
    @hits = 0
    ship_position(position)
  end

  def ship_position(position)
    @coordinates = []
    size.times do
      if position[1..2].to_i < 1 || position[1..2].to_i > 10 || position[0] < 'A' || position[0] > 'J'
        fail "Out of bounds"
      end    
      coordinates << position
      case direction
      when :S
        position = position[0] + (position[1..2].to_i + 1).to_s
      when :N
        position = position[0] + (position[1..2].to_i - 1).to_s
      when :E
        position = position[0].next + position[1..2]
      when :W
        position = prev(position[0]) + position[1..2]
      end
    end
  end

  def prev(letter)
    (letter.ord - 1).chr
  end

  def was_hit
    @hits += 1
  end

  def sunk?
    @hits == @size
  end

end
