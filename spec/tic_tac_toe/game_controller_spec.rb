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
  let(:controller) { TicTacToe::GameController.new(game: game) }

  describe "#display_board" do
    it "tells the game to display board" do
      allow(game).to receive(:display_board)
      controller.display_board
      expect(game).to have_received(:display_board)
    end
  end

  describe "#make_move" do
    it "tells the game to make move" do
      expect(game).to receive(:make_move)
      controller.make_move
    end
  end

  describe "#next_player" do
    it "tells the game to switch current player" do
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