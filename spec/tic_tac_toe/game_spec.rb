require 'tic_tac_toe/game'

describe TicTacToe::Game do
  describe "#human_mark" do
    it "returns the mark for the human player" do
      game = TicTacToe::Game.new
      game.human_mark = "X"
      expect(game.human_mark).to eql "X"
    end
  end
end