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
  end
end
