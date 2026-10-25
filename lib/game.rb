class Game
  def initialize(dealer_class, player_class)
    @dealer = dealer_class.new
    @player = player_class.new
  end

  def play
    (1..12).each do |turn|
      puts "\nAttempt ##{turn}\n"
      guess = @player.guess
      feedback = @dealer.feedback(guess)
      if feedback[:absolute] == 4
        puts "The Player Wins!! #{guess.join(' ').capitalize} is the correct code"
        return true
      end
      @player.recieve_feedback(feedback)
    end
    puts "\nThe Dealer Wins!! #{@dealer.code.join(' ').capitalize} is the correct code."
  end
end
