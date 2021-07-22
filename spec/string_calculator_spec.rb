require 'string_calculator'

RSpec.describe StringCalculator, 'model' do
  let(:string_calculator) {StringCalculator.new}

  describe '#add' do
    context 'when empty string is given as input' do
      it 'should return 0' do
        expect(string_calculator.add('')).to eq(0)
      end
    end

    context 'when single number is given as string input' do
      it 'should return same number' do
        expect(string_calculator.add('1')).to eq(1)
      end
    end

    context 'when multiple number separated by comma are given as input' do
      it 'should return sum of given numbers' do
        expect(string_calculator.add('1,2')).to eq(3)
      end
    end

    context 'when multiple number separated by comma or new_line character are given as input' do
      it 'should return sum of given numbers' do
        expect(string_calculator.add("1\n2,3")).to eq(6)
      end
    end

    context 'when delimeter is given as part of number ' do
      it 'should return sum of given numbers including numbers separated by given delimeter' do
        expect(string_calculator.add("//;\n1;2")).to eq(3)
      end
    end

    context 'when numbers include negative values' do
      it 'should throw an error as negatives not allowed along with negative number' do
        expect {string_calculator.add("//;\n1;-2\n3")}.to raise_error(StandardError, 'negatives not allowed: -2')
      end
    end

    context 'when numbers include multiple negative values' do
      it 'should throw an error as negatives not allowed along with all negative number' do
        expect {string_calculator.add("//;\n1;-2\n3,-4\n5,-6")}.to raise_error(StandardError, 'negatives not allowed: -2,-4,-6')
      end
    end

    context 'when numbers include values beyond 1000' do
      it 'should return sum of values upto 1000' do
        expect(string_calculator.add("//;\n1000;1001\n999,2000")).to eq(1999)
      end
    end

    context 'when default delimeter contains more that one characters' do
      it 'should return sum of values' do
        expect(string_calculator.add("//[***]\n1***2***3")).to eq(6)
      end
    end

    context 'when number contains multiple default delimeters' do
      it 'should return sum of values separated by all delimeters' do
        expect(string_calculator.add("//[*][%]\n1*2%3")).to eq(6)
      end
    end

    context 'when number contains multiple default long delimeters' do
      it 'should return sum of values separated by all delimeters' do
        expect(string_calculator.add("//[**][%%]\n1**2%%3")).to eq(6)
      end
    end
  end

  describe '#called_count' do
    it 'should return number of times add method was invoked on instance' do
      string_calculator.add("1")
      string_calculator.add("1,2")
      string_calculator.add("1,2,3")

      expect(string_calculator.called_count).to eq(3)
    end
  end
end