class Boat

  attr_reader :position, :direction, :size, :hits

  def initialize(name, size, position, direction)
    @name = name
    @size = size
    @position = position
    @direction = direction
    @hits = 0
    @coordinates = []

    size.times do
      @coordinates << position
      case direction
        when :N
          position = position[0] + (position[1].to_i - 1).to_s
        when :S
          position = position[0] + (position[1].to_i + 1).to_s
        when :E
          position = (position[0].ord + 1).chr + position[1]
        when :W
          position = (position[0].ord - 1).chr + position[1]
      end
    end



  end

  def was_hit
    @hits += 1
  end

  def sunk?
    @hits == @size
  end

end
