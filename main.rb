require_relative "lib/game"
require_relative "lib/computer_dealer"
require_relative "lib/human_dealer"
require_relative "lib/human_player"
require_relative "lib/computer_player"

def pick_dealer
  puts "\nWhat dealer do you want?"
  puts "1. Human"
  puts "2. Computer"
  loop do
    choice = gets.chomp.strip
    return HumanDealer if choice == "1"
    return ComputerDealer if choice == "2"

    puts "\nEnter 1 or 2"
  end
end

def pick_player
  puts "\nWhat player do you want?"
  puts "1. Human"
  puts "2. Computer"
  loop do
    choice = gets.chomp.strip
    return HumanPlayer if choice == "1"
    return ComputerPlayer if choice == "2"

    puts "\nEnter 1 or 2"
  end
end

loop do
  puts "Play new game? (yes/no)"

  break unless %w[y yes].include?(gets.chomp.strip.downcase)

  dealer = pick_dealer
  player = pick_player

  Game.new(dealer, player).play
end
