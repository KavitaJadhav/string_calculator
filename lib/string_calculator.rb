class StringCalculator
  def add numbers
    numbers.empty? ? 0 : numbers.split(/\n|,/).sum(&:to_i)
  end
end