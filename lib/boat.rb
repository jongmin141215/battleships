class Boat

<<<<<<< HEAD
  attr_reader :position, :direction, :size, :on_target, :coordinates
=======
  attr_reader :position, :direction, :size, :hits, :coordinates
>>>>>>> 588a445... Practicing: Added direction & bounds

  def initialize(size, position, direction)
    @size = size
    @position = position
    @direction = direction
<<<<<<< HEAD
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



=======
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
>>>>>>> 588a445... Practicing: Added direction & bounds
  end

  def was_hit
    @on_target += 1
  end

  def sunk?
    @on_target == @size
  end

end
