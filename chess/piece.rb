require_relative 'nullpiece'

class Piece

  attr_reader :symbol, :color, :board
  attr_accessor :pos

  def initialize(board, pos, color )
    if color == :white
      @opp_color = :black
    else
      @opp_color = :white
    end
    @color = color
    @board = board
    @pos = pos
  end

  def to_s
    " #{@symbol} "
  end

  def empty?
    @board[@pos] == NullPiece
  end

  def valid_moves(end_pos)

    raise ArgumentError.new " you can not move your #{@symbol} to #{end_pos} " if @board[end_pos].color == @color
    x, y  = end_pos
    raise ArgumentError.new " end_pos is not in the board " unless x.between?(0,7) || y.between?(0,7)
    #raise ArgumentError.new " You can not move this piece #{@symbol} to #{end_pos} , because that will put you in check." if move_into_check?(end_pos)

  end

  def move_into_check?(to_pos)
    start = @pos.dup
    end_pos = to_pos.dup
    #temp_piece = @board[to_pos].dup
    # keep the piece if it removed and restore it.

    @board.move(start, end_pos)

    is_in_check = @board.in_check?(@color)

    @board.move(end_pos, start)
    #temp_piece.pos = end_pos
    #@board[end_pos] = temp_piece
    is_in_check
  end
end
