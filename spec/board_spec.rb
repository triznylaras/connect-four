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

      it 'create 7 things in each row (column) by default' do
        board.grid.each do |row|
          expect(row.size).to eq(7)
        end
      end
    end

    context '#grid' do
      it 'returns the grid' do
        board = Board.new(grid: "\u25cb")
        expect(board.grid).to eq "\u25cb"
      end
    end
  end
end