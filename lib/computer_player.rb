require_relative "player"

class ComputerPlayer < Player
  def initialize
    super
    @correct_colors = []
    @total_correct = 0
    @current_color = 0
    @guess = [COLORS[0], COLORS[0], COLORS[0], COLORS[0]]
  end

  def guess
    puts @guess.join(" ")
    @guess
  end

  def recieve_feedback(feedback)
    @current_color += 1
    return rand_guess if @total_correct >= 4

    correct = feedback[:absolute] + feedback[:partial]
    unless correct > 0
      @guess = [COLORS[@current_color], COLORS[@current_color], COLORS[@current_color], COLORS[@current_color]]
      return
    end

    @total_correct += correct
    (1..correct).each { @correct_colors << @guess[0] }
    @guess = [COLORS[@current_color], COLORS[@current_color], COLORS[@current_color], COLORS[@current_color]]
    puts @correct_colors
    puts @total_correct
  end

  private

  def rand_guess
    @guess = [@correct_colors.sample, @correct_colors.sample, @correct_colors.sample, @correct_colors.sample]
  end
end
