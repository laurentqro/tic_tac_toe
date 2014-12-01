require 'tic_tac_toe/game'
require 'tic_tac_toe/display'

describe TicTacToe::Game do
  context "when the game starts" do
    describe "#start" do
      it "displays game intro" do
        input = StringIO.new
        output = StringIO.new
        display = TicTacToe::Display.new(input: input, output: output)
        game = TicTacToe::Game.new(display: display)
        game.start
        expect(output.string).to eql "** TicTacToe **\n"
      end
    end
  end
end