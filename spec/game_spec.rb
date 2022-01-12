require 'spec_helper'
require_relative '../lib/connect_four/circle'

module ConnectFour
  describe Game do
    include Circle

    describe '#verify_input' do
      subject(:input_verification) { described_class.new }

      context 'when player types valid input' do
        valid_input = 0
        it 'returns true' do
          expect(input_verification.verify_input(valid_input)).to be true
        end
      end

      context 'when player types invalid value that is already occupied' do
        let(:game_board) { input_verification.instance_variable_get(:@board) }

        before do
          game_board.grid[0][2] = 'X'
        end

        it 'returns false' do
          invalid_input = 2
          expect(input_verification.verify_input(invalid_input)).to be false
        end
      end

      context 'when player types invalid value greater than 7' do
        it 'returns false' do
          invalid_input = 8
          expect(input_verification.verify_input(invalid_input)).to be false
        end
      end

      context 'when player types invalid value less than 1' do
        it 'returns false' do
          invalid_input = -2
          expect(input_verification.verify_input(invalid_input)).to be false
        end
      end
    end

    describe '#player_turn' do
      subject(:turn_verification) { described_class.new }
      let(:player1) { turn_verification.instance_variable_get(:@player1) }
      let(:player2) { turn_verification.instance_variable_get(:@player2) }

      before do
        player1.name = 'Laras'
        player2.name = 'Jane'
      end

      context "when it is player1's turn" do
        it 'returns player1' do
          expect(turn_verification.player_turn.name).to eq(player1.name)
        end
      end

      context "when it is player2's turn" do
        before do
          turn_verification.instance_variable_set(:@turn, 1)
        end

        it 'returns player2' do
          expect(turn_verification.player_turn.name).to eq(player2.name)
        end
      end
    end
  end
end
