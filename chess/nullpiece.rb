require 'singleton'
require_relative 'piece'

class NullPiece < Piece
  include Singleton

  def moves
  end

end
