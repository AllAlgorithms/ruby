# frozen_string_literal: true
# Conway's Game of Life
#
# Author: Sebastian Sangervasi

class GameOfLife
  def self.from_str(string)
    non_empty_lines =
      string
      .split("\n")
      .lazy
      .map(&:strip)
      .reject(&:empty?)
    
    parsed_grid = non_empty_lines.lazy.map do |line|
      lazy_line = line.split('').lazy.map do |char|
        Cell.from_str(char)
      end
      lazy_line.to_a
    end

    new(grid: parsed_grid.to_a)
  end

  def initialize(grid:)
    @grid = grid
  end

  attr_reader :grid

  def height
    grid.size
  end

  def width
    grid.first&.size || 0
  end

  def to_s
    str_rows = grid.map do |row|
      row.map(&:to_s).join
    end
    str_rows.join("\n")
  end

  def next_generation
    lazy_grid = grid_with_live_neighbor_counts.map do |row|
      lazy_row = row.map do |cell, neighbor_count|
        cell.next_state(neighbor_count)
      end
      lazy_row.to_a
    end

    self.class.new(grid: lazy_grid.to_a)
  end
  
  private

  def grid_with_live_neighbor_counts
    grid.lazy.each_with_index.map do |row, row_index|
      row.lazy.each_with_index.map do |cell, cell_index|
        [cell, count_live_neighbors(row_index, cell_index)]
      end
    end
  end

  def count_live_neighbors(row, col)
    neighbor_coords = neighbor_directions.map do |d_row, d_col|
      [row + d_row, col + d_col]
    end
    neighbors = neighbor_coords.lazy.map do |row, col|
      get_cell(row, col, default: Dead.new)
    end
    neighbors.map { |cell| cell.alive? ? 1 : 0 }.sum
  end

  def neighbor_directions
    @neighbor_directions ||= begin
      directions_1D = [-1, 0, 1]
      directions_1D
        .product(directions_1D)
        .reject { |pair| pair == [0, 0] }
    end   
  end

  def get_cell(row, col, default: nil)
    is_within_rows = (0...height).cover?(row)
    is_within_cols = (0...width).cover?(col)
    return grid[row][col] if is_within_rows && is_within_cols

    default
  end
end

class Cell
  def self.from_str(string)
    return Live.new if string == Live::STRING_FORM
    Dead.new
  end

  def to_s
    self.class::STRING_FORM
  end
end

class Dead < Cell
  STRING_FORM = '·'

  def alive?
    false
  end

  def next_state(neighbor_count)
    return Live.new if neighbor_count == 3
    Dead.new
  end
end

class Live < Cell
  STRING_FORM = '0'

  def alive?
    true
  end

  def next_state(neighbor_count)
    return Live.new if (2..3).cover?(neighbor_count)
    Dead.new
  end
end

def glider_example
  seed_str = <<~GLIDER
    ··0····
    0·0····
    ·00····
    ·······
    ·······
    ·······
  GLIDER
  seed_game = GameOfLife.from_str(seed_str)
  num_gens = 15
  puts <<~HEADER
    =========================
    | Conway's Game of Life |
    =========================
    Starting with seed: "Glider"
    Running for #{num_gens} generations.
  HEADER
  latest_generation = seed_game
  (1..num_gens).map do |gen_num|
    puts "Generation #{gen_num}:"
    puts latest_generation
    latest_generation = latest_generation.next_generation
  end
end

if __FILE__ == $0
  glider_example
end
