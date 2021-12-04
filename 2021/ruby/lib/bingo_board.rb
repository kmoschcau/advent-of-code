# frozen_string_literal: true

# A 5x5 Bingo board
class BingoBoard
  # @param lines [Array<String>] five lines of Bingo board rows with 5 cols each
  # @raise If either the rows or columns are not exactly five
  def initialize(lines)
    raise "Incorrect number of lines! (#{lines.size})" unless lines.size == 5

    @board = lines.map { |line| line.strip.split.map!(&:to_i) }

    @board.each do |row|
      raise "Incorrect number of columns! (#{row.size})" unless row.size == 5
    end

    @marks = Array.new(5) { Array.new(5, false) }
  end

  # Mark a number on the board
  # @param number [Integer] the number to mark on the board
  # @return [Boolean] whether the marking resulted in a win on the board
  def mark(number)
    row_idx, col_idx = find_number number

    if row_idx && col_idx
      @marks[row_idx][col_idx] = true
      return check_win row_idx, col_idx
    end
    false
  end

  # Get the sum of the unmarked numbers on the board
  # @return [Integer] the sum of unmarked numbers
  def unmarked_sum
    sum = 0
    @board.each_with_index do |row, row_idx|
      row.each_with_index do |num, col_idx|
        sum += num unless @marks[row_idx][col_idx]
      end
    end
    sum
  end

  protected

  # Find a number on the board. This only finds the first occurrence in a
  # line-wise search. If the board does not have the number, two nils are
  # returned.
  # @param number [Integer] the number to search for
  # @return [Array(Integer, Integer)] the row and column index of the number
  def find_number(number)
    col_idx = nil
    row_idx = @board.index do |row|
      idx = row.index number
      col_idx = idx if idx
      idx
    end
    [row_idx, col_idx]
  end

  # Check if a marking in the given row and column result in a win.
  # @param row_idx [Integer] the row index to check in
  # @param col_idx [Integer] the column index to check in
  # @return [Boolean] whether the marking resulted in a win
  def check_win(row_idx, col_idx)
    check_for_row_win(row_idx) || check_for_col_win(col_idx)
  end

  # Check if the marking in the given row resulted in a win by row.
  # @param row_idx [Integer] the row index to check in
  # @return [Boolean] whether the marking resulted in a win
  def check_for_row_win(row_idx)
    @marks[row_idx].all?
  end

  # Check if the marking in the given row resulted in a win by column.
  # @param col_idx [Integer] the column index to check in
  # @return [Boolean] whether the marking resulted in a win
  def check_for_col_win(col_idx)
    @marks.map { |row| row[col_idx] }.all?
  end

  def to_s
    s = "#{'-' * 20}\n"
    @board.each_with_index do |row, row_idx|
      row.each_with_index do |num, col_idx|
        s += @marks[row_idx][col_idx] ? '|' : ' '
        s += format('%2d', num)
        s += @marks[row_idx][col_idx] ? '|' : ' '
      end
      s += "\n"
    end
    s += "#{'-' * 20}\n"
    s
  end
end
