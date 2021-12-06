# frozen_string_literal: true

# Determine the number of lanternfish after 256 days.
# @param lines [Array<String>] the file contents get the data
# @return [Integer] the number of lanternfish after 256 days
def d6p2(lines)
  simulate_school lines.first.split(',').map(&:to_i), 256
end
