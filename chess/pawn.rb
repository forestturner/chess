require_relative "piece"

class Pawn < Piece
  def initialize (board,pos,color)
    super
    @symbol = "♟"
    @initialize_pos = pos
  end
  def moves()
    # p move_dirs()
    total_moves = self.move_dirs.map{|x, y| [x + @pos[0], y + @pos[1]]}
    total_moves.select {|pos| @board[pos].color != @color}
    total_moves += side_attacks()
    total_moves.select {|x,y| x.between?(0,7) && y.between?(0,7) }

  end
  def at_start_row?()
    @pos == @initialize_pos
  end
  def move_dirs()
    return [[1,0],[2,0]] if self.at_start_row? && @color == :black && @board[[@pos[0], @pos[1] + 1]].is_a?(NullPiece)
    return [[-1,0],[-2,0]] if self.at_start_row? && @color == :white && @board[[@pos[0], @pos[1] - 1]].is_a?(NullPiece)
    return [[1,0]] if !self.at_start_row? && @color == :black && @board[[@pos[0], @pos[1] + 1]].is_a?(NullPiece)
    return [[-1,0]] if !self.at_start_row? && @color == :white && @board[[@pos[0], @pos[1] - 1]].is_a?(NullPiece)
    []
  end
  def side_attacks()
    x,y = @pos
    moves =[]

    if @color == :black
      temp_ary = [[x - 1, y + 1], [x + 1, y + 1]]
      temp_ary.each do |move|
        moves << move if @board.in_bounds?(move) && @board[move].color == :white
      end
    else
      temp_ary = [[x + 1, y - 1], [x - 1, y - 1]]
      temp_ary.each do |move|
        moves << move if @board.in_bounds?(move) && @board[move].color == :black
      end
    end
    moves
  end

end


    #
    #  if @color == :black
    #    if @board[x + 1 ,y - 1].color != @board[x - 1,y - 1].color &&
    #      @board[x - 1 ,y - 1].color != @board[x - 1,y - 1]
    #      return [[1,-1],[-1, -1]]
    #    elsif @board[x - 1 ,y - 1].color != @board[x - 1,y - 1]
    #      [-1, -1]
    #    else
    #     [][1,-1]]
    #   end
    # else


#
#
