require_relative 'board'
require_relative 'player'

class Chess
  def initialize
    @board = Board.new
    @players = [Player.new(@board, :white), Player.new(@board, :black)]
    @current_player = @players[0]
    @winner = nil
  end

  def play
    loop do
      begin
        start_pos = @current_player.move
        end_pos = @current_player.move
        @board.move(start_pos, end_pos)

      rescue ArgumentError => e
        puts "#{e.message}"
        sleep(3)
        retry
      end



      @board.rows.map{|row| p row.map{|i| i.to_s }.join("")}
      sleep(2)

      swap_turn!

      if @board.checkmate?(:white)
        @winner = "white"
        break
      elsif @board.checkmate?(:black)
        @winner = "black"
        break
      end
    end
    puts "The winner is #{@winner}"
  end

  def swap_turn!
    @current_player = @current_player == @players[0] ? @players[1] : @players[0]
  end
end

game = Chess.new
game.play
