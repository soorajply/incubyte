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


  end
end
