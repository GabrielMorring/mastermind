require_relative "player"

class ComputerPlayer < Player
  def guess
    guess = [COLORS.sample, COLORS.sample, COLORS.sample, COLORS.sample]
    puts guess.join(" ")
    guess
  end

  def recieve_feedback(feedback)
  end
end
