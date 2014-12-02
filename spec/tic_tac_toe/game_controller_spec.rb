require 'tic_tac_toe/game_controller'
require 'tic_tac_toe/display'
require 'tic_tac_toe/game'
require 'tic_tac_toe/board'

describe TicTacToe::GameController do

  let(:input) { StringIO.new }
  let(:output) { StringIO.new }
  let(:display) { TicTacToe::Display.new(input: input, output: output) }
  let(:controller) { TicTacToe::GameController.new(display: display) }
  let(:board) { TicTacToe::Board.new(grid: [1, 2, 3, 4, 5, 6, 7, 8, 9]) }
  let(:game) { TicTacToe::Game.new(board: board) }

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

  describe "#display_board" do
    it "displays the current game's board" do
      board = TicTacToe::Board.new(grid: [1, 2, 3, 4, "X", 6, "O", 8, 9])
      game = TicTacToe::Game.new(board: board)
      controller = TicTacToe::GameController.new(display: display, game: game)
      controller.display_board
      expect(output.string).to eql " 1 | 2 | 3\n---+---+---\n 4 | X | 6\n---+---+---\n O | 8 | 9\n"
    end
  end
end