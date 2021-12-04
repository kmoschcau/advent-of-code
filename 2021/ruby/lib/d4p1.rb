# frozen_string_literal: true

require_relative 'bingo_board'

# Determine the winning board's product of unmarked numbers and last marked
# number.
# @param lines [Array<String>] the file contents get the data
# @return [Integer] the product
def d4p1(lines)
  draw, boards = read_data(lines)

  draw.each do |number|
    win_board = boards.find { |board| board.mark number }
    return win_board.unmarked_sum * number if win_board
  end

  0
end

# Read in the passed lines and create a draw order and boards.
# @param lines [Array<String>] the file contents
# @return [Array(Array<Integer>, Array<BingoBoard>)] the draw and boards
def read_data(lines)
  draw = lines.shift.split(',').map(&:to_i)
  boards = []
  until lines.empty?
    if lines[0] == ''
      lines.shift
    else
      boards << BingoBoard.new(lines.shift(5))
    end
  end
  [draw, boards]
end
