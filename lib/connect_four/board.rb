module ConnectFour
  class Board
    attr_reader :grid

    def initialize(input = {})
      @grid = input.fetch(:grid, default_grid)
    end

    def default_grid
      Array.new(6) { Array.new(6) { Cell.new } }
    end
  end
end
