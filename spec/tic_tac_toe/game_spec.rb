require 'tic_tac_toe/computer'
require 'tic_tac_toe/human'
require 'tic_tac_toe/display'
require 'tic_tac_toe/game'

describe TicTacToe::Game do

  let(:board) { TicTacToe::Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9]) }
  let(:computer) { TicTacToe::Computer.new }
  let(:human) { TicTacToe::Human.new }
  let(:input) { StringIO.new }
  let(:output) { StringIO.new }
  let(:display) { TicTacToe::Display.new(input: input, output: output) }
  let(:game) { TicTacToe::Game.new(board: board, computer: computer, human: human, display: display) }

  describe "#is_won?" do
    it "returns true if the game is won" do
      board = TicTacToe::Board.new(["X", "O", "X", "O", "X", "O", "O", 8, "X"])
      game = TicTacToe::Game.new(board: board)
      expect(game.is_won?).to eql true
    end

    it "returns false if the game is not won" do
      expect(game.is_won?).to eql false
    end
  end

  describe "#is_draw?" do
    it "returns true if game is a draw" do
      board = TicTacToe::Board.new(["X", "O", "X", "O", "X", "O", "X", "O", "X"])
      game = TicTacToe::Game.new(board: board)
      expect(game.is_draw?).to eql true
    end

    it "returns false if game is not a draw" do
      expect(game.is_draw?).to eql false
    end
  end

  describe "#is_over?" do
    it "returns true if game is won" do
      board = TicTacToe::Board.new(["X", "O", "X", "O", "X", "O", "O", 8, "X"])
      game = TicTacToe::Game.new(board: board)
      expect(game.is_won?).to eql true
      expect(game.is_over?).to eql true
    end

    it "returns true if game is draw" do
      board = TicTacToe::Board.new(["X", "O", "X", "O", "X", "O", "X", "O", "X"])
      game = TicTacToe::Game.new(board: board)
      expect(game.is_draw?).to eql true
      expect(game.is_over?).to eql true
    end
  end

  describe "#next_player" do
    context "when the current player is human, next player is computer" do
      it "sets the game's current player to computer" do
        game = TicTacToe::Game.new(board: board, computer: computer, human: human)
        game.current_player = human
        game.next_player
        expect(game.current_player).to eql computer
      end
    end
  end

  describe "#make_move" do
    it "tells the current player to make a move" do
      game.current_player = [computer, human].sample
      expect(game.current_player).to receive(:make_move)
      game.make_move
    end
  end
end