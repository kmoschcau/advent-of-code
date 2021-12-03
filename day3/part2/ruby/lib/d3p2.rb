# frozen_string_literal: true

# Calculate the life support rating of the submarine.
# @param lines [Array<String>] the file contents get the report data from
# @return [Integer] the life support rating
def calc_life_support(lines)
  o2_gen_rating = O2Searcher.new(lines).find.to_i 2
  co2_srub_rating = Co2Searcher.new(lines).find.to_i 2
  o2_gen_rating * co2_srub_rating
end

# A superclass for line searchers, implementing common methods
class PrefixSearcher
  # Create a new PrefixSearcher
  # @param lines [Array<String>] the lines to search in
  def initialize(lines)
    @lines = lines.dup
    @idx = 0
  end

  # Find the line for the wanted type of number
  # @return [String] the line
  def find
    char = filter_char
    @lines.select! { |line| line[@idx] == char }
    return @lines.first if @lines.size == 1

    @idx += 1
    find
  end

  protected

  # Count the occurrences of ones in the given lines and column index.
  # @return [Integer] the count of ones in the column
  def ones_in_col
    acc = 0
    @lines.each { |line| acc += line[@idx].to_i }
    acc
  end

  # Get the filter char for the current column
  # @return [String] the filter character for the column
  def filter_char
    raise 'This has to be implemented by subclasses!'
  end
end

# A PrefixSearcher to search for the O2 generator rating line
class O2Searcher < PrefixSearcher
  def filter_char
    ones_in_col >= @lines.size / 2.0 ? '1' : '0'
  end
end

# A PrefixSearcher to search for the CO2 scrubber rating line
class Co2Searcher < PrefixSearcher
  def filter_char
    ones_in_col < @lines.size / 2.0 ? '1' : '0'
  end
end
