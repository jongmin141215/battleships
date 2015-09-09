class Ship
  attr_reader :position
  def initialize(position, direction)
    @position = position
    @direction = direction
    @size = 1
    @hits = 0
  end
end

# Version 'Skateboard'
# class Ship
#   def initialize(position)
#     @position = position
#   end
# end
