require_relative 'board'
require_relative 'player'
require_relative 'display'
require 'pry-byebug'

module ConnectFour
  class Game
    include Circle
    include Display

    def initialize
      @board = Board.new
      @player1 = Player.new(yellow_circle)
      @player2 = Player.new(blue_circle)
      @turn = 0
    end

    def verify_input(input)
      input.between?(0, 6) && !@board.full_column?(input)
    end

    def player_turn
      @turn += 1
      @turn.odd? ? @player1 : @player2
    end
  end
end
