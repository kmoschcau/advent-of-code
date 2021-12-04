# frozen_string_literal: true

require_relative 'd4p1'
require_relative 'bingo_board'

# Determine the winning board's product of unmarked numbers and last marked
# number.
# @param lines [Array<String>] the file contents get the data
# @return [Integer] the product
def d4p2(lines)
  draw, boards = read_data(lines)

  draw.each do |number|
    if boards.size == 1
      return boards.first.unmarked_sum * number if boards.first.mark number
    else
      boards.delete_if { |board| board.mark number }
    end
  end

  0
end
