require 'tic_tac_toe/game_controller'
require 'tic_tac_toe/display'
require 'tic_tac_toe/game'

describe TicTacToe::GameController do

  let(:input) { StringIO.new }
  let(:output) { StringIO.new }
  let(:display) { TicTacToe::Display.new(input: input, output: output) }
  let(:controller) { TicTacToe::GameController.new(display: display) }
  let(:game) { TicTacToe::Game.new }

  describe "#display_game_title" do
    it "displays game title" do
      controller.display_game_title
      expect(output.string).to eql "** TicTacToe **\n"
    end
  end

  describe "#display_choice_of_mark" do
    it "tells the human player to choose X or O mark" do
      controller.display_choice_of_mark
      expect(output.string).to eql "Choose your mark:\n1: X\n 2: O\n"
    end
  end

  describe "#set_human_mark" do
    it "sets human mark" do
      input = StringIO.new("1\n")
      controller = TicTacToe::GameController.new(display: display, game: game)
      controller.set_human_mark_with(input.string)
      expect(controller.game.human_mark).to eql "X"
    end
  end
end