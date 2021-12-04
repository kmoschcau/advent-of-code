# frozen_string_literal: true

require_relative 'submarine'

# Calculate the end position of the submarine.
# @param lines [Array<String>] the lines containing the commands
# @return [Integer] the end position
def d2p2(lines)
  sub = SubmarineD2P2.new
  lines.each do |line|
    sub.command line
  end
  sub.depth * sub.position
end
