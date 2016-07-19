require_relative 'slidingpiece'

class Bishop < SlidingPiece
  def initialize(board, pos, color)
    super
    @symbol = :bishop
  end

  def move_dirs
    [[-1, -1], [-1, 1], [1, -1], [1, 1]]
  end
end
