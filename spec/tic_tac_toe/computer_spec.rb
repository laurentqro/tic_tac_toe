require "tic_tac_toe/computer"
require "tic_tac_toe/board"

describe TicTacToe::Computer do

  describe "#winning_space" do
    it "returns a winning space" do
      computer = TicTacToe::Computer.new(mark: "X")
      board = TicTacToe::Board.new ["X", "X", 3, 4, 5, 6, 7, 8, 9]
      expect(computer.winning_space(computer.mark, board)).to eql 3
    end
  end

  describe "#opponent_winning_space" do
    it "returns the opponent's winning space" do
      computer = TicTacToe::Computer.new(mark: "X")
      board = TicTacToe::Board.new [1, 2, 3, 4, 5, 6, "O", "O", 9]
      expect(computer.opponent_winning_space(board)).to eql 9
    end
  end

  describe "#make_move" do
    it "sets the computer's mark on a given space" do
      computer = TicTacToe::Computer.new(mark: "X")
      board = TicTacToe::Board.new [1, 2, 3, 4, 5, 6, 7, 8, 9]
      computer.make_move(3, board)
      expect(board.grid).to eql [1, 2, "X", 4, 5, 6, 7, 8, 9]
    end
  end

  describe "#space_to_fork" do
    it "finds a space that creates two threats to win" do
      computer = TicTacToe::Computer.new(mark: "X")
      board = TicTacToe::Board.new ["X", "O",  3,
                                     4 , "X",  6,
                                     7 ,  8 , "O"]
      expect(computer.space_to_fork("X", board)).to eql 4
      expect(computer.space_to_fork("O", board)).to eql nil
    end
  end

  describe "#determine_best_move" do
    context "when it has two in a row" do
      it "places a third to get three in a row" do
        computer = TicTacToe::Computer.new(mark: "X")
        board = TicTacToe::Board.new ["X", "O",  3,
                                       4 , "X",  6,
                                      "O",  8 ,  9]
        best_move = computer.determine_best_move(board)
        expect(best_move).to eql 9
      end
    end

    context "when the opponent has two in a row" do
      it "plays the third to block the opponent" do
        computer = TicTacToe::Computer.new(mark: "X")
        board = TicTacToe::Board.new ["O", "O",  3,
                                       4 , "X",  6,
                                       7,  "X" , 9]
        best_move = computer.determine_best_move(board)
        expect(best_move).to eql 3
      end
    end

    context "when it has two non-blocked lines of two" do
      it "creates a fork (two threats to win)" do
        computer = TicTacToe::Computer.new(mark: "X")
        board = TicTacToe::Board.new ["X", "O",  3,
                                       4 , "X",  6,
                                       7,   8 , "O"]
        best_move = computer.determine_best_move(board)
        expect(best_move).to eql 4
      end
    end

    context "when blocking the opponent's opportunity to create a fork" do
      xit "creates two in a row to force the opponent into defending" do
      end

      xit "does not result in the opponent creating a fork" do
      end

      xit "blocks the opponent's fork" do
      end
    end

    context "when there is no opportunity to win, block, fork, or block a fork" do
      xit "plays center" do
      end
    end

    context "when the opponent is in a corner" do
      xit "plays the opposite corner" do
      end
    end

    context "a corner is available" do
      xit "plays any of the available corners" do
      end
    end

    context "a side is available" do
      xit "plays any of the available sides" do
      end
    end


  end

end
