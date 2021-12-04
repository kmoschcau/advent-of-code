# frozen_string_literal: true

# A submarine, model D2P1
class SubmarineD2P1
  # The regex to parse a command.
  CMD_REGEX = /(?<word>forward|down|up) (?<amount>\d+)/.freeze

  attr_reader :depth, :position

  def initialize
    @depth = 0
    @position = 0
  end

  # Parse a command and dispatch to the other methods
  def command(command)
    match = CMD_REGEX.match command
    send(match[:word], Integer(match[:amount]))
  end

  # Move the sub forward
  def forward(amount)
    @position += amount
  end

  # Move the sub down
  def down(amount)
    @depth += amount
  end

  # Move the sub up
  def up(amount)
    @depth -= amount
  end
end

# A submarine, model D2P2
class SubmarineD2P2 < SubmarineD2P1
  attr_reader :aim

  def initialize
    super
    @aim = 0
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
