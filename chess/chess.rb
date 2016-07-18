require_relative 'board'

class Chess
  def initialize
    @players = [:white, :black]
    @current_player = @players[0]
    @board = Board.new
  end

  def play

  end

  def notify_players
    puts "#{ @current_player.to_s }'s turn."
  end

  def swap_turn!
    @current_player = (@current_player == :white) ? :black : :white
  end
end
