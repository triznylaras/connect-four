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

    def get_cell(x_ax, y_ax)
      grid[y_ax][x_ax]
    end

    def set_cell(x_ax, y_ax, value)
      grid[y_ax][x_ax].value = value
    end
  end
end
