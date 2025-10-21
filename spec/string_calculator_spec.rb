require 'rspec'
require_relative '../string_calculator'

RSpec.describe StringCalculator do
  describe 'add method' do
    context 'when input is empty' do
      it 'returns 0' do
        expect(StringCalculator.add("")).to eq(0)
      end
    end

    context 'when input has one number' do
      it 'should return the number itself' do
        expect(StringCalculator.add("1")).to eq(1)
      end
    end

    context 'when input has two or more comma-separated numbers' do
      it 'returns their sum' do
        expect(StringCalculator.add("1,5,2")).to eq(8)
      end
    end

    context 'when input has multiple numbers' do
      it 'returns the sum of all numbers' do
        expect(StringCalculator.add("1,2,3,4,5")).to eq(15)
      end
    end

    context 'when input contains newlines between numbers' do
      it 'handles newline as a valid delimiter' do
        expect(StringCalculator.add("1\n2,3")).to eq(6)
      end
    end

    context 'when a custom delimiter is specified' do
      it 'supports single-character custom delimiter' do
        expect(StringCalculator.add("//;\n1;2")).to eq(3)
      end

      it 'supports another custom delimiter' do
        expect(StringCalculator.add("//|\n2|3|4")).to eq(9)
      end
    end

    context 'when input contains negative numbers' do
      it 'raises an exception with the negative number' do
        expect { StringCalculator.add("1,-2,3") }
          .to raise_error(RuntimeError, "negative numbers not allowed -2")
      end

      it 'raises an exception listing all negative numbers' do
        expect { StringCalculator.add("1,-2,-3,4") }
          .to raise_error(RuntimeError, "negative numbers not allowed -2,-3")
      end
    end

  end
end
