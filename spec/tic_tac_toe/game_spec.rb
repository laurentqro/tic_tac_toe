describe TicTacToe::Game do

  let(:board) { TicTacToe::Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9]) }
  let(:computer) { TicTacToe::Computer.new }
  let(:game) { TicTacToe::Game.new(board: board, computer: computer) }

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
end