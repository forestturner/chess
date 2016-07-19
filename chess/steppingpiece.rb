require_relative "piece"
class SteppingPiece < Piece
  def initialize(board, pos, color)
    super
  end
  def moves
    total_moves = self.move_dirs.map{|x, y| [x + @pos[0], y + @pos[1]]}
    total_moves.select {|x,y| x.between?(0,7) && y.between?(0,7) }
  end

end
