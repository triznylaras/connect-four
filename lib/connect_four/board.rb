require_relative 'circle'

module ConnectFour
  class Board
    include Circle

    attr_reader :grid

    def initialize
      @grid = Array.new(6) { Array.new(7) { empty_circle } }
    end

    def display_board
      @grid.each do |row|
        puts row.join(' ')
      end
      puts (1..7).to_a.join(' ')
    end

    def update_board(row, column, value)
      @grid[row][column] = value
    end

    def full_column?(input)
      @grid[0][input] != empty_circle
    end

    def available_row(column)
      row = 0
      loop do
        return row if row == 5 || @grid[row + 1][column] != empty_circle

        row += 1
      end
    end

    def check_horizontal(row, column, value)
      return if column > 3

      @grid[row][column] == value && @grid[row][column + 1] == value && @grid[row][column + 2] == value && @grid[row][column + 3] == value
    end

    def check_vertical(row, column, value)
      return if row > 2

      @grid[row][column] == value && @grid[row + 1][column] == value && @grid[row + 2][column] == value && @grid[row + 3][column] == value
    end

    def check_left_diagonal(row, column, value)
      return if column > 3

      @grid[row][column] == value && @grid[row + 1][column + 1] == value && @grid[row + 2][column + 2] == value && @grid[row + 3][column + 3] == value
    end

    def check_right_diagonal(row, column, value)
      return if column < 3

      @grid[row][column] == value && @grid[row + 1][column - 1] == value && @grid[row + 2][column - 2] == value && @grid[row + 3][column - 3] == value
    end

    def check_diagonals(row, column, value)
      return unless row < 3

      check_right_diagonal(row, column, value) || check_left_diagonal(row, column, value)
    end

    def check_row(row, column, value)
      check_horizontal(row, column, value) || check_vertical(row, column, value) || check_diagonals(row, column, value)
    end
  end
end
