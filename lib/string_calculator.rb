class StringCalculator
  def initialize
    @add_method_call_count = 0
  end

  def add numbers
    increment_add_call_count

    return 0 if numbers.empty?

    values = values_from(numbers)
    negative_values = values.select {|value| value < 0}
    raise NegativeValueError, negative_values unless negative_values.empty?

    values.reject! {|value| value > 1000}

    if numbers.start_with?('*')
      values.reduce(&:*)
    else
      values.sum
    end
  end

  def called_count
    @add_method_call_count
  end

  private

  def increment_add_call_count
    @add_method_call_count += 1
  end

  def values_from numbers
    delimiters = [',', "\n"]

    if numbers.start_with?('//') || numbers.start_with?('*//')
      default_delimeter = default_delimeters numbers
      delimiters = delimiters + default_delimeter

      numbers_only = remove_default_delimeter numbers
    else
      numbers_only = numbers
    end

    # puts numbers_only
    numbers_only.split(Regexp.union(delimiters)).map(&:to_i)
  end

  def remove_default_delimeter numbers
    delimeters_string = numbers.split(/\n/)[0]
    res = numbers.gsub("#{delimeters_string}\n", '')
    res
  end

  def default_delimeters numbers
    delimeter_string = numbers.split(/\n/)[0]
    delimeter_string.gsub!('*//', '')
    delimeter_string.gsub!('//', '')
    delimeter_string.gsub!('[', '') #Todo: Refactor logic to get multiple delimeters withing [] brackets
    delimeter_string.split(']')
  end
end

# Notes
# Use regex