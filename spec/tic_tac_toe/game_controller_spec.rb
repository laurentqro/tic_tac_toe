require 'tic_tac_toe/game_controller'
require 'tic_tac_toe/display'

describe TicTacToe::GameController do

  describe "#display_game_title" do
    it "displays game title" do
      input = StringIO.new
      output = StringIO.new
      display = TicTacToe::Display.new(input: input, output: output)
      game = TicTacToe::GameController.new(display: display)
      game.display_game_title
      expect(output.string).to eql "** TicTacToe **\n"
    end
  end

  describe "#display_choice_of_mark" do
    it "tells the human player to choose X or O mark" do
      input = StringIO.new
      output = StringIO.new
      display = TicTacToe::Display.new(input: input, output: output)
      game = TicTacToe::GameController.new(display: display)
      game.display_choice_of_mark
      expect(output.string).to eql "Choose your mark:\n1: X\n 2: O\n"
    end
  end
end