# frozen_string_literal: true

# Calculate the end position of the submarine.
# @param file [#each] the file get the move commands from
# @return [Integer] the end position
def calc_position(file)
  sub = Submarine.new
  file.each do |line|
    sub.command line
  end
  sub.depth * sub.position
end

# A simple model of a submarine with methods to move it
class Submarine
  # The regex to parse a command.
  CMD_REGEX = /(?<word>forward|down|up) (?<amount>\d+)/.freeze

  attr_reader :aim, :depth, :position

  def initialize
    @aim = 0
    @depth = 0
    @position = 0
  end

  # Parse a command and dispatch to the other methods
  def command(command)
    match = CMD_REGEX.match command
    send(match[:word], Integer(match[:amount]))
  end

  # Move the sub
  def forward(amount)
    @position += amount
    @depth += @aim * amount
  end

  # Increase aim
  def down(amount)
    @aim += amount
  end

  # Decrease aim
  def up(amount)
    @aim -= amount
  end
end
