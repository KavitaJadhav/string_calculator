class StringCalculator
  def add numbers
    return 0 if numbers.empty?

    if numbers.start_with?('//')
      default_delimeter = numbers.split(/\n/)[0].gsub('//', '')
      numbers.gsub!("//#{default_delimeter}\n", '')
      numbers.split(/\n|,|#{default_delimeter}/).sum(&:to_i)
    else
      numbers.split(/\n|,/).sum(&:to_i)
    end
  end
end