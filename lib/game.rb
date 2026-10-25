class Game
  def initialize(dealer_class, player_class)
    @dealer = dealer_class.new
    @player = player_class.new
  end

  def play
    (1..12).each do |turn|
      guess = @player.guess
      feedback = @dealer.feedback(guess)
      if feedback[:absolute] == 4
        puts "The Player Wins!! #{guess} is the correct code"
        return
      end
    end
    puts "The Dealer Wins!! #{@dealer.code.capitalize} is the correct code."
  end
end
