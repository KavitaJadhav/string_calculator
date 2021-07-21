class StringCalculator
  def add numbers
    numbers.empty? ? 0 : numbers.split(',').sum(&:to_i)
  end
end