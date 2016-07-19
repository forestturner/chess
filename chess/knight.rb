require_relative "steppingpiece"
require_relative "board"


class Knight < SteppingPiece
  def initialize(board, pos, color)
    super
    @symbol = :knight
  end

  def move_dirs
    [[-2,-1],[-1,-2],[2,-1],[1,-2],[-2,1],[-1,2],[2,1],[1,2]]
  end
end

b = Board.new()
q = Knight.new(b,[0, 0],:white)
p q.moves
