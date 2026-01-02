Dir[File.join(__dir__, 'lib', '*.rb')].sort.each { |file| require file }
require 'colorize'

if __FILE__ == $PROGRAM_NAME

  puts "Enter a name for " + "player x:".magenta
  name_x = gets.chomp.strip
  name_x = "Player x" if name_x.empty?
  puts "Enter a name for " + "player o:".yellow
  name_o = gets.chomp.strip
  name_o = "Player o" if name_o.empty?

  player_x = Player.new(name_x, "x", :magenta)
  player_o = Player.new(name_o, "o", :yellow)

  Game.new(player_x, player_o).start

end
