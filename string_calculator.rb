class StringCalculator
  def self.add(numbers)
    return 0 if numbers.nil? || numbers.empty?

    all_numbers = numbers.split(',')
    all_numbers.map(&:to_i).sum
  end
end
