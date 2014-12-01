require 'tic_tac_toe/game_controller'
require 'tic_tac_toe/display'

describe TicTacToe::GameController do

  let(:input) { StringIO.new }
  let(:output) { StringIO.new }
  let(:display) { TicTacToe::Display.new(input: input, output: output) }
  let(:game) { TicTacToe::GameController.new(display: display) }

  describe "#display_game_title" do
    it "displays game title" do
      game.display_game_title
      expect(output.string).to eql "** TicTacToe **\n"
    end
  end

  describe "#display_choice_of_mark" do
    it "tells the human player to choose X or O mark" do
      game.display_choice_of_mark
      expect(output.string).to eql "Choose your mark:\n1: X\n 2: O\n"
    end
  end
end