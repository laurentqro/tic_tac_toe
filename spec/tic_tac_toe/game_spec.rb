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

  describe "#display_board" do
    it "tells the display to output the board" do
      allow(display).to receive(:output_board).with(board.grid)
      game.display_board
      expect(display).to have_received(:output_board).with(board.grid)
    end
  end

  describe "#display_outcome" do
    context "when there is a winner" do
      it "announces win if human player won" do
        game.current_player = human
        allow(board).to receive(:winner?).and_return(true)
        allow(display).to receive(:output_win_announcement)
        game.display_outcome
        expect(display).to have_received(:output_win_announcement)
      end

      it "announces loss if human player lost" do
        game.current_player = computer
        allow(board).to receive(:winner?).and_return(true)
        allow(display).to receive(:output_loss_announcement)
        game.display_outcome
        expect(display).to have_received(:output_loss_announcement)
      end
    end

    context "when the game draws" do
      it "announces draw" do
        allow(board).to receive(:draw?).and_return(true)
        allow(display).to receive(:output_draw_announcement)
        game.display_outcome
        expect(display).to have_received(:output_draw_announcement)
      end
    end
  end
end