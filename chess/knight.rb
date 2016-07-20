require_relative "steppingpiece"


class Knight < SteppingPiece
  def initialize(board, pos, color)
    super
    @symbol = "♞"
  end

  def move_dirs
    [[-2,-1],[-1,-2],[2,-1],[1,-2],[-2,1],[-1,2],[2,1],[1,2]]
  end
end

#
