class Boat

  attr_reader :position, :direction, :size, :on_target, :coordinates

  def initialize(name, size, position, direction)
    @name = name
    @size = size
    @position = position
    @direction = direction
    @on_target = 0
    @coordinates = []

    size.times do
      fail 'boat out of bounds' if position[0] > "E" || position[0] < "A" || position[1].to_i > 5 || position[1].to_i == 0
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
    @on_target += 1
  end

  def sunk?
    @on_target == @size
  end

end
