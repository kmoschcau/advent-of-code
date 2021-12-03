# frozen_string_literal: true

# Calculate the power consumption of the submarine.
# @param file [Array<String>] the file contents get the report data from
# @return [Integer] the power consumption
def calc_consumption(file)
  lines = file.to_a
  num_cols = lines[0].strip.size
  num_lines = lines.size
  occurrences = get_counts_of_one lines, num_cols
  gamma = compose_binary occurrences, num_lines
  epsilon = gamma ^ ('1' * num_cols).to_i(2)
  gamma * epsilon
end

# Get the occurrences of ones for each column of the input data.
# @param lines [Array<String>] the file contents to get the counts from
# @param num_cols [Integer] the amount of columns to count for
# @return [Array(Integer, Integer, Integer, Integer, Integer)] the counts of one
#     for each column
def get_counts_of_one(lines, num_cols)
  cols = Array.new(num_cols, 0)
  lines.each do |line|
    (0...num_cols).each do |index|
      cols[index] += Integer(line[index])
    end
  end
  cols
end

# Compose a binary number from the most common occurrences of ones per bit.
# @param cols [Array(Integer, Integer, Integer, Integer, Integer)] the bit
#     counts
# @param size [Integer] the overall size of the original input
# @returns [Integer] the resulting binary
def compose_binary(cols, size)
  half = size / 2
  cols.map { |count| count > half ? 1 : 0 }.join.to_i 2
end
