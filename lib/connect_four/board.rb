require_relative 'circle'

module ConnectFour
  class Board
    include Circle

    attr_reader :grid

    def initialize(input = {})
      @grid = input.fetch(:grid, default_grid)
    end

    def default_grid
      Array.new(6) { Array.new(7) { Cell.new(empty_circle) } }
    end

    def get_cell(row, column)
      grid[row][column]
    end

    def set_cell(row, column, value)
      grid[row][column].value = value
    end

    def check_horizontal(row, column, value)
      return if column > 3

      grid[row][column] == value && grid[row][column + 1] == value && grid[row][column + 2] == value && grid[row][column + 3] == value
    end

    def check_vertical(row, column, value)
      return if row > 2

      grid[row][column] == value && grid[row + 1][column] == value && grid[row + 2][column] == value && grid[row + 3][column] == value
    end

    def check_left_diagonal(row, column, value)
      return if column > 3

      grid[row][column] == value && grid[row + 1][column + 1] == value && grid[row + 2][column + 2] == value && grid[row + 3][column + 3] == value
    end

    def check_right_diagonal(row, column, value)
      return if column < 3

      grid[row][column] == value && grid[row + 1][column - 1] == value && grid[row + 2][column - 2] == value && grid[row + 3][column - 3] == value
    end
  end
end
