# frozen_string_literal: true

# Determine the number of lanternfish after 80 days.
# @param lines [Array<String>] the file contents get the data
# @return [Integer] the number of lanternfish after 80 days
def d6p1(lines)
  simulate_school lines.first.split(',').map(&:to_i), 80
end

# Simulate a school of lanternfish for the given number of days and return the
# final size. The passed fish are represented by their spawn counter.
# @param initial_school [Array<Integer>] the initial school of fish
# @param days [Integer] the number of days to simulate
# @return [Integer] the amount of fish in the school
def simulate_school(initial_school, days)
  counter_groups = Array.new(9, 0)
  initial_school.each { |counter| counter_groups[counter] += 1 }
  days.times do
    counter_groups.rotate!
    counter_groups[6] += counter_groups[8]
  end
  counter_groups.sum
end
