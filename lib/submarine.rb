require_relative 'ship'

class Submarine < Ship

  def initialize(position, direction)
    super(position, direction)
    @size = 2
  end

  def grid
    a = ("A".."J").to_a
    n = (1..10).to_a
    n.map { |n| a.map { |a| a + n.to_s } }
  end

  def prev(letter)
    str = 'ABCDEFGHJI'
    prev = str[str.index(letter)-1]
  end

  def new_pos
    if direction == :N
      position[0] + (position[1].to_i - 1).to_s
    elsif direction == :S
      position[0] + (position[1].to_i + 1).to_s
    elsif direction == :W
      prev(position[0]) + position[1]
    elsif direction == :E
      position[0].next + position[1]
    end
  end

  def all_positions
      return [position, new_pos]
  end

end

