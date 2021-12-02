# frozen_string_literal: true

# Count the increases of numbers between two consecutive windows, consisting of
# three lines in a file.
# @param file [#each_cons] the file to count increases in
# @return [Integer] the number of increases
def count_increases_windowed(file)
  increases = 0
  prev = nil
  file.each_cons 3 do |line1, line2, line3|
    sum = Integer(line1) + Integer(line2) + Integer(line3)
    increases += 1 if !prev.nil? && sum > prev
    prev = sum
  end
  increases
end
