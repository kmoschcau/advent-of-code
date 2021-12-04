# frozen_string_literal: true

# Count the increases of numbers between two consecutive lines.
# @param lines [Array<String>] the lines to count in
# @return [Integer] the number of increases
def d1p1(lines)
  increases = 0
  lines.each_cons 2 do |line1, line2|
    increases += 1 if line1.to_i < line2.to_i
  end
  increases
end
