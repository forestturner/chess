require_relative "piece"

class SlidingPiece < Piece
  def initialize(board, pos, color)
    super
  end

  def moves
    # return all moves possible before valid_moves else where
    total_moves = []
    self.move_dirs.each do |x,y|
      (1..7).each do |number|
        current = [x * number, y * number]
        break if @board[current].color == @color
        total_moves << current
        break if @board[current].color == @opp_color
      end
    end

    total_moves = total_moves.uniq.map{|x, y| [x + @pos[0], y + @pos[1]]}
    #total_moves.delete(@pos)
    total_moves = total_moves.select {|x,y| x.between?(0,7) && y.between?(0,7) }
    
    total_moves.select {|x,y| @board[[x,y]] != NullPiece }
  end

end
