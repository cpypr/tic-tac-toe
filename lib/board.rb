class Board

  WIN_COMBOS = [
    [0,1,2],[3,4,5],[6,7,8], # rows
    [0,3,6],[1,4,7],[2,5,8], # cols
    [0,4,8],[2,4,6]          # diagonals
  ]

  def initialize
    @cells = Array.new(9, " ")
  end

  def display
    puts "  Tic-Tac-Toe  ".white.underline.on_black
    @cells.each.with_index(1) do |c, i|
      print "[ #{ c == ' ' ? i.to_s.light_black : c} ]".on_black
      puts if i % 3 == 0
    end
    puts ""
  end

  def place_marker(i, marker, marker_color)
    return false unless (0..8).include?(i) && @cells[i] == ' '

    @cells[i] = marker.colorize(marker_color).bold
    true
  end

  def winner
    WIN_COMBOS.each do |a,b,c|
      next if [@cells[a], @cells[b], @cells[c]].include?(" ")
      return @cells[a] if @cells[a] == @cells[b] && @cells[b] == @cells[c]
    end
    nil
  end

  def full?
    @cells.none? { |c| c == " " }
  end

  def draw?
    full? && winner.nil?
  end

  def available_moves
    @cells.each_index.select { |i| @cells[i] == " " }
  end

end
