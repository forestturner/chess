require_relative 'slidingpiece'

class Queen < SlidingPiece
  def initialize(board, pos, color)
    super
    @symbol = :queen
  end

  def move_dirs
    [[-1, -1], [-1, 1], [1, -1], [1, 1], [0, 1], [1, 0], [0, -1], [-1, 0]]
  end
end
