require_relative 'nullpiece'
require_relative 'piece'
require_relative 'slidingpiece'
require_relative 'steppingpiece'
require_relative 'queen'
require_relative 'bishop'
require_relative 'knight'
require_relative 'rook'
require_relative 'king'
require_relative 'pawn'



class Board
  attr_reader :rows, :black_pieces

  def initialize
    @rows = Array.new(8) { Array.new(8){ NullPiece.instance} }
    make_starting_grid()

    @black_pieces = []
    @white_pieces = []
    create_white_and_black_array()

    #make_starting_grid()
  end

  def create_white_and_black_array()
    @rows.each_with_index do |row, idx1|
      row.each_with_index do |col, idx2|
        @black_pieces << col if col.color == :black
        @white_pieces << col if col.color == :white
      end
    end
  end


  def make_starting_grid ()
    self[[0,0]] = Rook.new(self, [0,0], :black)
    self[[0,1]] = Knight.new(self, [0,1], :black)
    self[[0,2]] = Bishop.new(self, [0,2], :black)
    self[[0,3]] = Queen.new(self, [0,3], :black)
    self[[0,4]] = King.new(self, [0,4], :black)
    self[[0,5]] = Bishop.new(self, [0,5], :black)
    self[[0,6]] = Knight.new(self, [0,6], :black)
    self[[0,7]] = Rook.new(self, [0,7], :black)

    @rows[1].map!.with_index { |el, i| Pawn.new(self, [1, i], :black) }

    self[[7,0]] = Rook.new(self, [7,0], :white)
    self[[7,1]] = Knight.new(self, [7,1], :white)
    self[[7,2]] = Bishop.new(self, [7,2], :white)
    self[[7,3]] = Queen.new(self, [7,3], :white)
    self[[7,4]] = King.new(self, [7,4], :white)
    self[[7,5]] = Bishop.new(self, [7,5], :white)
    self[[7,6]] = Knight.new(self, [7,6], :white)
    self[[7,7]] = Rook.new(self, [7,7], :white)
    @rows[6].map!.with_index { |el, i| Pawn.new(self, [6, i], :white) }


  end

  def [](pos)
    x, y = pos
    @rows[x][y]
  end

  def in_bounds?(pos)
    x,y = pos
    return true if x.between?(0,7) && y.between?(0,7)
    false
  end

  def []=(pos,value)
    x,y = pos
    @rows[x][y] = value
  end

  def move(start_pos, end_pos)
    #updates the pieces position
    #raise "there is no piece!" if self[start_pos].is_a?(NullPiece)
    #raise "the end location of your move is taken up by another one of your pieces." if #self[end_pos].valid_move?
    # begin
    #   self[start_pos].valid_moves(end_pos)
    # rescue ArgumentError => e
    #   retry
    # end
    self[start_pos].valid_moves(end_pos)
    self[end_pos] = self[start_pos]
    self[end_pos].pos = end_pos
    self[start_pos] = NullPiece.instance
  end


  def in_check?(color)
    pos_king = find_king(color)
    #total_possible_moves = []
    @rows.each_with_index do |row, idx1|
      row.each_with_index do |col, idx2|
        pos = [idx1,idx2]
        if self[pos].moves.include?(pos_king)
          p self[pos]
          p pos_king
          return true
        end
      end
    end
    false
  end

  def checkmate?(color)
    return false if in_check?(color)
    puts "In check"
    sleep(10)
    king_pos = find_king(color)
    king_piece = self[king_pos]
    return false unless king_piece.moves.all?{|move| king_piece.move_into_check?(move) }
    puts "king can't move"
    sleep(10)
    if color == :black
      current_players_pieces = @black_pieces
    else
      current_players_pieces = @white_pieces
    end
    current_players_pieces.each do |piece|
      piece.moves.each do |try_move|
        return false unless piece.move_into_check?(try_move)
      end
    end
    true
  end

  def find_king(color)
    @rows.each_with_index do |row, idx1|
      row.each_with_index do |col, idx2|
        pos = [idx1,idx2]
        if self[pos].is_a?(King) && self[pos].color == color
          return pos
        end
      end
    end

  end
end
