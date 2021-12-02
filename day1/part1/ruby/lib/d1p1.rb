# frozen_string_literal: true

# Count the increases of numbers between two consecutive lines in a file.
# @param file [File] the file to count increases in
# @return [Integer] the number of increases
def count_increases(file)
  increases = 0
  file.each_cons 2 do |line1, line2|
    increases += 1 if Integer(line1) < Integer(line2)
  end
  increases
end
