require "tic_tac_toe/computer"

describe TicTacToe::Computer do

  let(:computer) { TicTacToe::Computer.new }

  describe "#winning_space" do
    it "returns a winning space" do
      computer.mark = "X"
      board = TicTacToe::Board.new ["X", "X", 3, 4, 5, 6, 7, 8, 9]
      expect(computer.winning_space(computer.mark, board)).to eql 3
    end
  end

  describe "#opponent_winning_space" do
    it "returns the opponent's winning space" do
      computer.mark = "X"
      board = TicTacToe::Board.new [1, 2, 3, 4, 5, 6, "O", "O", 9]
      expect(computer.opponent_winning_space(board)).to eql 9
    end
  end

  describe "#make_move" do
    it "sets the computer's mark on a given space" do
      computer.mark = "X"
      board = TicTacToe::Board.new [1, 2, 3, 4, 5, 6, 7, 8, 9]
      allow(computer).to receive(:determine_best_move) { 3 }
      computer.make_move(board)
      expect(board.grid).to eql [1, 2, "X", 4, 5, 6, 7, 8, 9]
    end
  end

  describe "#space_to_fork" do
    it "finds a space that creates two threats to win" do
      computer.mark = "X"
      board = TicTacToe::Board.new ["X", "O", 3, 4, "X", 6, 7, 8, "O"]
      expect(computer.space_to_fork("X", board)).to eql 4
      expect(computer.space_to_fork("O", board)).to eql nil
    end
  end

  describe "#determine_best_move" do
    context "when it has two in a row" do
      it "places a third to get three in a row" do
        computer.mark = "X"
        board = TicTacToe::Board.new ["X", "O", 3, 4, "X", 6, "O", 8 , 9]
        best_move = computer.determine_best_move(board)
        expect(best_move).to eql 9
      end
    end

    context "when the opponent has two in a row" do
      it "plays the third to block the opponent" do
        computer.mark = "X"
        board = TicTacToe::Board.new ["O", "O", 3, 4, "X", 6, 7, "X", 9]
        best_move = computer.determine_best_move(board)
        expect(best_move).to eql 3
      end
    end

    context "when it has two non-blocked lines of two" do
      it "creates a fork (two threats to win)" do
        computer.mark = "X"
        board = TicTacToe::Board.new ["X", "O", 3, 4, "X", 6, 7, 8, "O"]
        best_move = computer.determine_best_move(board)
        expect(best_move).to eql 4
      end
    end

    context "when opponent has the opportunity to create a fork" do
      it "creates two in a row to force the opponent into defending" do
        computer.mark = "X"
        board = TicTacToe::Board.new ["O", "X", 3, 4, "O", 6, 7, 8, "X"]
        best_move = computer.determine_best_move(board)
        expect([3, 6, 7, 8]).to include(best_move)
      end

      it "moves without giving the opponent the opportunity to create a fork" do
        computer.mark = "X"
        board = TicTacToe::Board.new ["O", "X", 3, 4, "O", 6, 7, 8, "X"]
        computer.make_move(board)
        expect(computer.space_to_fork("O", board)).to be_nil
      end

      it "successfully blocks the opponent's fork" do
        computer.mark = "X"
        board = TicTacToe::Board.new ["O", "X", 3, 4, "O", 6, 7, 8, "X"]
        expect(computer.space_to_fork("O", board)).not_to be_nil
        computer.make_move(board)
        expect(computer.space_to_fork("O", board)).to be_nil
      end
    end

    context "when there is no opportunity to win, block, fork, or block a fork" do
      it "plays center" do
        computer.mark = "X"
        board = TicTacToe::Board.new [1, 2, 3, 4, 5, 6, 7, 8, 9]
        expect(computer.winning_space(computer.mark, board)).to be_nil
        expect(computer.opponent_winning_space(board)).to be_nil
        expect(computer.space_to_fork(computer.mark, board)).to be_nil
        expect(computer.space_to_fork("O", board)).to be_nil
        best_move = computer.determine_best_move(board)
        expect(best_move).to eql 5
      end

      it "plays the opposite corner if the opponent is in a corner" do
        computer.mark = "X"
        board = TicTacToe::Board.new ["O", 2, 3, 4, "X", 6, 7, 8, 9]
        best_move = computer.determine_best_move(board)
        expect(best_move).to eql 9
      end

      it "plays any of the available corners if a corner is available" do
        computer.mark = "X"
        board = TicTacToe::Board.new [1, 2, 3, 4, "O", 6, 7, 8, 9]
        best_move = computer.determine_best_move(board)
        expect(best_move).to eql 1
      end

      it "plays any of the four available sides if everything else is taken" do
        computer.mark = "X"
        board = TicTacToe::Board.new ["X", "O", "X", 4, "X", "O", "O", "X", "O"]
        best_move = computer.determine_best_move(board)
        expect(best_move).to eql 4
      end
    end

    describe "#set_mark" do
      it "sets mark to X if other player picked O" do
        board = TicTacToe::Board.new [1, 2, 3, 4, "O", 6, 7, 8, 9]
        computer.set_mark(board)
        expect(computer.mark).to eql "X"
      end

      it "sets mark to O if other player picked X" do
        board = TicTacToe::Board.new [1, 2, 3, 4, "X", 6, 7, 8, 9]
        computer.set_mark(board)
        expect(computer.mark).to eql "O"
      end
    end
  end
end
