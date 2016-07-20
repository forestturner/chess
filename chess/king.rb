require_relative "steppingpiece"


class King < SteppingPiece
  def initialize(board, pos, color)
    super
    @symbol = "♚"
  end

  def move_dirs
    [[-1, -1], [-1, 1], [1, -1], [1, 1], [0, 1], [1, 0], [0, -1], [-1, 0]]
  end
end
