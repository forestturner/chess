require 'singleton'
#require_relative 'piece'

class NullPiece #< Piece
  include Singleton

  def pos=(pos)
  end

  def symbol
    "   "
  end

  def to_s
    "   "
  end

  def valid_moves(end_pos)
  end

  def moves
    []
  end

  def color
    :none
  end

end
