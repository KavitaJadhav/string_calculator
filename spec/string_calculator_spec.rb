require 'string_calculator'

RSpec.describe StringCalculator, 'model' do

  describe '#add' do
    context 'when empty string is given as input' do
      it 'should return 0' do
        string_calculator = StringCalculator.new

        expect(string_calculator.add('')).to eq(0)
      end
    end

    context 'when single number is given as string input' do
      it 'should return same number' do
        string_calculator = StringCalculator.new

        expect(string_calculator.add('1')).to eq(1)
      end
    end

    context 'when multiple number separated by comma are given as input' do
      it 'should return sum of given numbers' do
        string_calculator = StringCalculator.new

        expect(string_calculator.add('1,2')).to eq(3)
      end
    end

    context 'when multiple number separated by comma or new_line character are given as input' do
      it 'should return sum of given numbers' do
        string_calculator = StringCalculator.new

        expect(string_calculator.add("1\n2,3")).to eq(6)
      end
    end

    context 'when delimeter is given as part of number ' do
      it 'should return sum of given numbers including numbers separated by given delimeter' do
        string_calculator = StringCalculator.new

        expect(string_calculator.add("//;\n1;2")).to eq(3)
      end
    end

    context 'when numbers include negative values' do
      it 'should thow an error as negatives not allowed along with negative number' do
        string_calculator = StringCalculator.new

        expect {string_calculator.add("//;\n1;-2\n3")}.to raise_error(StandardError, 'negatives not allowed: -2')
      end
    end
  end
end