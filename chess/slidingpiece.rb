require_relative "piece"
require_relative "board"

class SlidingPiece < Piece
  def initialize(board, pos, color)
    super
  end

  def moves
    # return all moves possible before valid_moves else where
    total_moves = []
    self.move_dirs.each do |x,y|
      (0..7).each do |number|
        total_moves << [x * number, y * number]
      end
    end

    total_moves = total_moves.uniq.map{|x, y| [x + @pos[0], y + @pos[1]]}
    total_moves.delete(@pos)
    total_moves.select {|x,y| x.between?(0,7) && y.between?(0,7) }
  end

end
