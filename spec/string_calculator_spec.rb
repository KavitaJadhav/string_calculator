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
  end
end