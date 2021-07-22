class StringCalculator
  def initialize
    @add_method_call_count = 0
  end

  def add numbers
    @add_method_call_count += 1

    return 0 if numbers.empty?

    values = values_from(numbers)
    negative_values = values.select {|value| value < 0}
    raise StandardError.new "negatives not allowed: #{negative_values.join(',')}" unless negative_values.empty?
    values.sum
  end

  def called_count
    @add_method_call_count
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