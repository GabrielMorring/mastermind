require_relative "player"

class HumanPlayer < Player
  def guess
    puts "\nPlayer"
    puts "Enter a list of four colors of either red, yellow, blue, green, purple, or orange."
    loop do
      guess = gets.chomp.strip.downcase.split
      return guess if valid_guess?(guess)

      puts "\nInvalid guess. Must be four colors seperated by spaces. Try again"
      puts "Example guess: #{COLORS.sample} #{COLORS.sample} #{COLORS.sample} #{COLORS.sample}"
    end
  end

  def recieve_feedback(__feedback); end

  private

  def valid_guess?(guess)
    return false unless guess.length < 5

    guess.each { |word| return false unless COLORS.include?(word) }
    true
  end
end
