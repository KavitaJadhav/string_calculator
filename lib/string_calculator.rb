class StringCalculator
  def add numbers
    return 0 if numbers.empty?
    values_from(numbers).sum
  end

  private

  def values_from numbers
    delimiters = [',', "\n"]

    if numbers.start_with?('//')
      default_delimeter = default_delimeter numbers
      delimiters << default_delimeter

      numbers = remove_default_delimeter numbers
    end

    numbers.split(Regexp.union(delimiters)).map(&:to_i)
  end

  def remove_default_delimeter numbers
    delimeter = default_delimeter numbers
    numbers.gsub("//#{delimeter}\n", '')
  end

  def default_delimeter numbers
    numbers.split(/\n/)[0].gsub('//', '')
  end
end