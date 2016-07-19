require_relative 'nullpiece'

class Board
  attr_reader :rows

  def initialize
    @rows = Array.new(8) { Array.new(8) }

  end
  def make_starting_grid ()

  end
  def [](pos)
    x, y = pos
    @rows[x][y]
  end
  def []=(pos,value)
    x,y = pos
    @rows[x][y] = value
  end
  def dup
    @rows.map {|row| row.dup }
  end
  #
  def move(start_pos, end_pos)
  #updates the pieces position
  raise "there is no piece!" if self[start_pos].is_a?(NullPiece)
  #raise "the end location of your move is taken up by another one of your pieces." if #self[end_pos].valid_move?
  self[end_pos] = self[start_pos]
  self[start_pos] = NullPiece.instance
  end
  def checkmate?()

  end
  def find_king(color)
    @rows.each_with_index do |row, idx1|
      row.each_with_index do |col, idx2|
        pos = [idx1,idx2]
        if self[pos].is_a?(King)
          return pos
        end
      end
    end

  end
end
