require './lib/string_calculator'

class Application
  def self.run
    string_calculator = StringCalculator.new

    puts string_calculator.add('')
    puts string_calculator.add('1,2')
    puts string_calculator.add("1\n2,3")

    puts "add method call count: #{string_calculator.called_count}"
  end
end

Application.run