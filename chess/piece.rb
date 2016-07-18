
class Piece

  attr_reader :symbol, :color, :board, :pos

  def initialize(board, pos, color = :none)
    if color == :white
      @opp_color = :black
    else
      @opp_color = :white
    end
    @color = color
    @board = board
    @pos = pos
    @symbol = nil
  end

  def to_s
    "   "
  end

  def empty?
    @board[@pos] == NullPiece
  end

  def valid_moves(end_pos)

    raise " you can not move your #{@symbol} to #{end_pos} " if  @board[end_pos] != NullPiece &&
    @board[end_pos].color != @opp_color
    x,y  = end_pos
    raise " end_pos is not in the board " unless x.between?(0,7) || y.between?(0,7)

  end
  def moves
  end

  def move_into_check?(to_pos)

  end
end
