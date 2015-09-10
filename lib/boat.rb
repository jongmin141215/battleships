class Boat

  attr_reader :position, :direction, :size, :hits

  def initialize(name, size, position, direction)
    @name = name
    @size = size
    @position = position
    @direction = direction
    @hits = 0
  end

  def was_hit
    @hits += 1
  end

  def sunk?
    @hits == @size
  end

end
