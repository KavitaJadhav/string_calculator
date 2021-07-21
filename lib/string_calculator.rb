class StringCalculator
  def add numbers
    return 0 if numbers.empty?

    delimiters = [',', "\n"]

    if numbers.start_with?('//')
      default_delimeter = numbers.split(/\n/)[0].gsub('//', '')
      delimiters << default_delimeter
      numbers.gsub!("//#{default_delimeter}\n", '')
    end

    numbers.split(Regexp.union(delimiters)).sum(&:to_i)
  end
end