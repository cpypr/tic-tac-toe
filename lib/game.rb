class Game

  def initialize(player_x, player_o)
    @board = Board.new
    @players = { "x" => player_x, "o" => player_o }
    @current_marker = "x"
  end

  def start
    loop do
      system("clear") rescue nil
      @board.display
      current_player = @players[@current_marker]
      move = prompt_move(current_player)
      if @board.place_marker(move, @current_marker, current_player.marker_color)
        if @board.winner
          system("clear") rescue nil
          @board.display
          puts "#{current_player.name}".colorize(current_player.marker_color) + " wins!"
          break
        elsif @board.draw?
          system("clear") rescue nil
          @board.display
          puts "It's a draw!".green
          break
        else
          switch_player
        end
      else
        puts "Invalid move. Try again.".red
      end
    end
  end

  private

  def prompt_move(player)
    loop do
      print "[#{@current_marker}] #{player.name}".colorize(player.marker_color) + ", enter a move: "
      input = gets&.chomp
      if input.match?(/^[1-9]$/)
        return input.to_i - 1
      else
        puts "Please enter an available number".red
      end
    end
  end

  def switch_player
    @current_marker = (@current_marker == "x" ? "o" : "x")
  end

end
