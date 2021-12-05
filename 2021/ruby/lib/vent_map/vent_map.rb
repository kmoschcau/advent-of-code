# frozen_string_literal: true

require_relative 'grid_line'

# A map of hydrothermal vent lines
class VentMap
  def number_of_overlaps
    acc = 0
    @grid.each { |row| row.each { |num| acc += 1 if num >= 2 } }
    acc
  end

  protected

  # Build the internal grid from the given grid lines and draw them on the grid.
  # @param grid_lines [Array<GridLine>] the grid lines to build from and draw
  # @return [void]
  def build_from_grid_lines(grid_lines)
    width = grid_lines.map(&:max_x).max + 1
    height = grid_lines.map(&:max_y).max + 1
    @grid = Array.new(height) { Array.new(width, 0) }

    grid_lines.each { |grid_line| draw_line grid_line }
  end

  # Draw a line on the grid.
  # @param grid_line [GridLine] the line to draw
  # @return [void]
  def draw_line(grid_line)
    grid_line.line_coords.each do |x, y|
      @grid[y][x] += 1
    end
  end

  def to_s
    s = ''
    @grid.each do |row|
      row.each { |num| s += num.to_s }
      s += "\n"
    end
    s
  end
end

# A map of only grid aligned hydrothermal vent lines
class GridAlignedVentMap < VentMap
  # @param lines [Array<String>] the input lines from a file
  def initialize(lines)
    super()

    grid_lines = lines.map { |line| GridLine.new line }.keep_if(&:grid_aligned?)

    build_from_grid_lines grid_lines
  end
end

# A map of only grid aligned and diagonal hydrothermal vent lines
class DiagonalVentMap < VentMap
  # @param lines [Array<String>] the input lines from a file
  def initialize(lines)
    super()

    grid_lines = lines.map { |line| GridLine.new line }

    build_from_grid_lines grid_lines
  end
end
