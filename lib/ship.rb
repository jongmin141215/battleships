class Ship
  attr_reader :board
  def initialize(length = 2)
    @segments = Array.new(length)
    @board = nil
  end

  def size
    segments.length
  end

  # def set_board(board)
  #   @board = board
  # end


  private
  attr_accessor :segments
end
