require_relative "dealer"

class HumanDealer < Dealer
  def feedback(__guess)
    puts "\nDealer"
    puts "Enter the number of absolutely correct colors:"
    absolute = enter_num

    puts "\nEnter the number of partially correct colors:"
    partial = enter_num

    { partial: partial, absolute: absolute }
  end

  def code
    puts "\nDealer, enter the code you made."
    loop do
      code = gets.chomp.strip.split
      return code if valid_code?(code)

      puts "\nInvalid code. Must be four colors seperated by spaces. Try again"
      puts "Example code: #{COLORS.sample} #{COLORS.sample} #{COLORS.sample} #{COLORS.sample}"
    end
  end

  private

  def valid_code?(guess)
    return false unless guess.length < 5

    guess.each { |word| return false unless COLORS.include?(word) }
    true
  end

  def valid_feedback?(num)
    return false unless %w[0 1 2 3 4].include?(num)

    true
  end

  def enter_num
    loop do
      num = gets.chomp.strip
      return num.to_i if valid_feedback?(num)

      puts "\nInvalid feedback. Must be a number between 0 and 4. Try again"
    end
  end
end
