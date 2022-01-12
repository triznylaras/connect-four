module ConnectFour
  class Player
    attr_accessor :color, :name

    def initialize(color)
      @name = nil
      @color = color
    end
  end
end
