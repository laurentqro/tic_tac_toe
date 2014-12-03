require 'tic_tac_toe/game_controller'
require 'tic_tac_toe/display'
require 'tic_tac_toe/game'
require 'tic_tac_toe/board'

describe TicTacToe::GameController do

  let(:input) { StringIO.new }
  let(:output) { StringIO.new }
  let(:display) { TicTacToe::Display.new(input: input, output: output) }
  let(:board) { TicTacToe::Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9]) }
  let(:computer) { TicTacToe::Computer.new }
  let(:game) { TicTacToe::Game.new(board: board, computer: computer) }
  let(:controller) { TicTacToe::GameController.new(display: display, game: game) }

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
      controller = TicTacToe::GameController.new(display: display, game: game)
      allow(display).to receive(:get_user_input) { "1\n" }
      controller.set_human_mark
      expect(controller.human_mark).to eql "X"
    end
  end

  describe "#display_board" do
    it "displays the current game's board" do
      board = TicTacToe::Board.new([1, 2, 3, 4, "X", 6, "O", 8, 9])
      game = TicTacToe::Game.new(board: board, computer: computer)
      controller = TicTacToe::GameController.new(display: display, game: game)
      controller.display_board
      expect(output.string).to eql " 1 | 2 | 3\n---+---+---\n 4 | X | 6\n---+---+---\n O | 8 | 9\n"
    end
  end

  describe "#set_current_player_to" do
    it "sets the active game's current player" do
      controller.set_current_player_to(:human)
      expect(controller.current_player).to eql :human
    end
  end

  describe "#set_computer_mark" do
    it "sets the computer's mark depending on human player's choice" do
      allow(controller).to receive(:human_mark) { "X" }
      controller.set_computer_mark
      expect(computer.mark).to eql "O"
    end
  end

  describe "#make_move" do
    it "tells the current player to make his move" do
      allow(controller).to receive(:human_mark) { "X" }
      allow(controller).to receive(:current_player) { :human }
      allow(display).to receive(:get_user_input) { 1 }
      controller.make_move
      expect(game.board.grid).to eql ["X", 2, 3, 4, 5, 6, 7, 8, 9]
    end
  end

  describe "#next_player" do
    it "sets the current player to the next player" do
      controller.set_current_player_to(:human)
      controller.next_player
      expect(controller.current_player).to eql :computer
    end
  end

  describe "#prompt_for_move" do
    it "prompts the user to enter his move" do
      controller.prompt_for_move
      expect(output.string).to eql "Please enter the number of a space to mark it:\n"
    end
  end
end