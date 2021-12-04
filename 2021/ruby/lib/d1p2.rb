# frozen_string_literal: true

# Count the increases of numbers between two consecutive windows, consisting of
# three lines each.
# @param lines [Array<String>] the lines to count in
# @return [Integer] the number of increases
def d1p2(lines)
  increases = 0
  prev = nil
  lines.each_cons 3 do |line1, line2, line3|
    sum = line1.to_i + line2.to_i + line3.to_i
    increases += 1 if !prev.nil? && sum > prev
    prev = sum
  end
  increases
end
