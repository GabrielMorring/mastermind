require_relative "lib/game"
require_relative "lib/computer_dealer"
require_relative "lib/human_player"

loop do
  puts "Play new game? (yes/no)"

  break unless %w[y Y yes Yes].include?(gets.chomp.strip)

  Game.new(ComputerDealer, HumanPlayer).play
end
