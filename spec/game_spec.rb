require 'spec_helper'
require_relative '../lib/connect_four/circle'

module ConnectFour
  describe Game do
    include Circle

    let(:jane) { Player.new({ color: blue_circle, name: 'jane' }) }
    let(:laras) { Player.new({ color: yellow_circle, name: 'laras' }) }
    let(:game) { Game.new([jane, laras]) }

    context '#initialize' do
      before :each do
        allow_any_instance_of(Array).to receive(:shuffle) { [laras, jane] }
      end

      it 'randomly selects a current player' do
        expect(game.current_player).to eq laras
      end

      it 'randomly selects an other player' do
        expect(game.other_player).to eq jane
      end
    end

    context '#switch_players' do
      it 'will set @current_player to @other_player' do
        other_player = game.other_player
        game.switch_players
        expect(game.current_player).to eq other_player
      end

      it 'will set @other_player to @current_player' do
        current_player = game.current_player
        game.switch_players
        expect(game.other_player).to eq current_player
      end
    end
  end
end
