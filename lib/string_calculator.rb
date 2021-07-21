class StringCalculator
  def add numbers
    return 0 if numbers.empty?

    if numbers.start_with?('//')
      default_delimeter = numbers.split(/\n/)[0].gsub('//', '')
      numbers.gsub!("//#{default_delimeter}\n", '')
      delimeters = /\n|,|#{default_delimeter}/
    else
      delimeters = /\n|,/
    end
    
    numbers.split(delimeters).sum(&:to_i)
  end
end