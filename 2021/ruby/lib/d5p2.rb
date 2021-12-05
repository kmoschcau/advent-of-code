# frozen_string_literal: true

require_relative 'vent_map/vent_map'

# Determine the number of places on the generated vent map with 2 or higher
# overlapping vents.
# @param lines [Array<String>] the file contents get the data
# @return [Integer] the number of overlapping places
def d5p2(lines)
  map = DiagonalVentMap.new lines
  map.number_of_overlaps
end
