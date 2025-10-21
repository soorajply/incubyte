class StringCalculator
  def self.add(numbers)
    return 0 if numbers.nil? || numbers.empty?

    # delimiter = /,|\n/
    # data = numbers

    # # Detect custom delimiter of the form: //;\n1;2
    # if numbers.start_with?('//')
    #   header, data = numbers.split("\n", 2)
    #   custom = header[2..]
    #   escaped = Regexp.escape(custom)
    #   delimiter = Regexp.union(Regexp.new(escaped), /,/, /\n/)
    # end

    # all_numbers = data.split(delimiter)
    # all_numbers.map(&:to_i).sum

    delimiter = /,|\n/
    if numbers.start_with?("//")
      parts = numbers.split("\n", 2)
      custom_delimiter = Regexp.escape(parts[0][2..])
      delimiter = /#{custom_delimiter}/
      numbers = parts[1]
    end

    all_numbers = numbers.split(delimiter).map(&:to_i)


    negative_numbers = all_numbers.select { |n| n < 0 }
    unless negative_numbers.empty?
      raise "negative numbers not allowed #{negative_numbers.join(',')}"
    end

    all_numbers.sum
  end
end