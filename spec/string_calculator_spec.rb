require 'string_calculator'

RSpec.describe StringCalculator, 'model' do

  describe '#add' do
    context 'when empty string is given as input' do
      it 'should return 0' do
        string_calculator = StringCalculator.new

        expect(string_calculator.add('')).to eq(0)
      end
    end
  end
end