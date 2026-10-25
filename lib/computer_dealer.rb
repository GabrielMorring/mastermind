require_relative "dealer"

class ComputerDealer < Dealer
  def initialize
    super
    @code = [COLORS.sample, COLORS.sample, COLORS.sample, COLORS.sample]
  end

  attr_reader :code

  def feedback(guess)
    # temp_code and temp_guess are what is left in code and guess after we
    # remove all the absolutely correct guesses from both, then we compare
    # temps to find the partially correct guesses
    hash = { partial: 0, absolute: 0 }
    temp_code = @code.filter.with_index do |word, i|
      if word == guess[i]
        hash[:absolute] += 1
        false
      else
        true
      end
    end
    temp_guess = guess.filter.with_index { |word, i| word != @code[i] }
    temp_guess.each do |word|
      if temp_code.include?(word)
        hash[:partial] += 1
        temp_code.delete_at(temp_code.index(word) || temp_code.length)
      end
    end
    puts "\n#{hash[:partial]} partially correct guesses"
    puts "#{hash[:absolute]} absolutely correct guesses"

    hash
  end
end
