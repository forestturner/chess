require_relative 'slidingpiece'

class Rook < SlidingPiece
  def initialize(board, pos, color)
    super
    @symbol = "♜"
  end

  def move_dirs
    [[0, 1], [1, 0], [0, -1], [-1, 0]]
  end
end
