require 'spec_helper'

module ConnectFour
  describe Board do
    let(:board) { Board.new }

    context '#initialize' do
      it 'initializes the board with a grid' do
        expect { Board.new(grid: 'grid') }.to_not raise_error
      end

      it 'sets the grid with 6 rows by default' do
        expect(board.grid.size).to eq(6)
      end
    end
  end
end