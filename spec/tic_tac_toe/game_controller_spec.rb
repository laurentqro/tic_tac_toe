require 'tic_tac_toe/game_controller'
require 'tic_tac_toe/game'
require 'tic_tac_toe/human'

describe TicTacToe::GameController do

  let(:input) { StringIO.new }
  let(:output) { StringIO.new }
  let(:display) { TicTacToe::Display.new(input: input, output: output) }
  let(:board) { TicTacToe::Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9]) }
  let(:human) { TicTacToe::Human.new }
  let(:computer) { TicTacToe::Computer.new }
  let(:game) { TicTacToe::Game.new(board: board, computer: computer, human: human) }
  let(:controller) { TicTacToe::GameController.new(display: display, game: game) }

  describe "#display_choice_of_mark" do
    it "tells the human player to choose X or O mark" do
      allow(display).to receive(:get_mark)
      controller.display_choice_of_mark
      expect(display).to have_received(:get_mark)
    end
  end

  describe "#display_board" do
    it "tells the game to display board" do
      allow(game).to receive(:display_board)
      controller.display_board
      expect(game).to have_received(:display_board)
    end
  end

  describe "#set_computer_mark" do
    it "sets computer mark to O if first player picked X" do
      board = TicTacToe::Board.new(["X", 2, 3, 4, 5, 6, 7, 8, 9])
      game = TicTacToe::Game.new(board: board, computer: computer, human: human)
      controller = TicTacToe::GameController.new(display: display, game: game)
      controller.set_computer_mark
      expect(game.computer.mark).to eql "O"
    end

    it "sets computer mark to X if first player picked O" do
      board = TicTacToe::Board.new(["O", 2, 3, 4, 5, 6, 7, 8, 9])
      game = TicTacToe::Game.new(board: board, computer: computer, human: human)
      controller = TicTacToe::GameController.new(display: display, game: game)
      controller.set_computer_mark
      expect(game.computer.mark).to eql "X"
    end
  end

  describe "#set_human_mark" do
    it "sets human mark to X" do
      input = StringIO.new("1\n")
      display = TicTacToe::Display.new(input: input, output: output)
      controller = TicTacToe::GameController.new(display: display, game: game)
      controller.set_human_mark
      expect(game.human.mark).to eql "X"
    end

    it "sets human mark to O" do
      input = StringIO.new("2\n")
      display = TicTacToe::Display.new(input: input, output: output)
      controller = TicTacToe::GameController.new(display: display, game: game)
      controller.set_human_mark
      expect(game.human.mark).to eql "O"
    end
  end

  describe "#make_move" do
    it "tells the game to make move" do
      expect(game).to receive(:make_move)
      controller.make_move
    end
  end

  describe "#next_player" do
    it "tells the game to switche current player" do
      allow(game).to receive(:next_player)
      controller.next_player
      expect(game).to have_received(:next_player)
    end
  end

  describe "#display_game_outcome" do
    it "displays the outcome of the game" do
      allow(game).to receive(:display_outcome)
      controller.display_game_outcome
      expect(game).to have_received(:display_outcome)
    end
  end
end