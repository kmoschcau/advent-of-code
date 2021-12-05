# frozen_string_literal: true

# A line on the vent map grid
class GridLine
  # A regex to parse a grid line from a file input line
  LINE_REGEX = /(?<x1>\d+),(?<y1>\d+) -> (?<x2>\d+),(?<y2>\d+)/.freeze

  attr_reader :x1, :x2, :y1, :y2

  # @param line [String] a file input line
  def initialize(line)
    match = LINE_REGEX.match line
    @x1 = match[:x1].to_i
    @y1 = match[:y1].to_i
    @x2 = match[:x2].to_i
    @y2 = match[:y2].to_i
  end

  # Determine whether this line is grid aligned, meaning it is either horizontal
  # or vertial.
  # @return [Boolean] whether this line is grid aligned
  # @see #horizontal?
  # @see #vertical?
  def grid_aligned?
    horizontal? || vertical?
  end

  # Determine the minimum coordinate on the x axis.
  # @return [Integer] the max x coordinate
  def min_x
    [@x1, @x2].min
  end

  # Determine the maximum coordinate on the x axis.
  # @return [Integer] the max x coordinate
  def max_x
    [@x1, @x2].max
  end

  # Determine the minimum coordinate on the y axis.
  # @return [Integer] the max y coordinate
  def min_y
    [@y1, @y2].min
  end

  # Determine the maximum coordinate on the y axis.
  # @return [Integer] the max y coordinate
  def max_y
    [@y1, @y2].max
  end

  # Determine whether this line is horizontal, meaning both x coordinates are
  # equal.
  # @return [Boolean] whether this line is horizontal
  def horizontal?
    @y1 == @y2
  end

  # Determine whether this line is vertical, meaning both y coordinates are
  # equal.
  # @return [Boolean] whether this line is vertical
  def vertical?
    @x1 == @x2
  end

  # Get the line coordinates for this line. This includes the end points and any
  # points in between.
  # @return [Array<Array(Integer, Integer)>] the coordinates
  def line_coords
    (x_line_coords).zip(y_line_coords)
  end

  def to_s
    format('%<x1>d,%<y1>d -> %<x2>d, %<y2>d',
           x1: @x1, y1: @y1, x2: @x2, y2: @y2)
  end

  protected

  # Get the x coordinates of the line.
  def x_line_coords
    if @x1 < @x2
      (@x1..@x2)
    elsif @x1 > @x2
      @x1.downto @x2
    else
      Array.new(y_line_coords.size, @x1)
    end
  end

  # Get the y coordinates of the line.
  def y_line_coords
    if @y1 < @y2
      (@y1..@y2)
    elsif @y1 > @y2
      @y1.downto @y2
    else
      Array.new(x_line_coords.size, @y1)
    end
  end
end
