require "tic_tac_toe/computer"
require "tic_tac_toe/board"
require 'tic_tac_toe/player'

describe TicTacToe::Computer do

  let(:computer) { TicTacToe::Computer.new }

  before(:example) do
    computer.mark = "X"
  end

  describe "#choose_mark" do
    it "chooses O if first player made first move with X" do
      computer.board = TicTacToe::Board.new ["X", 2, 3, 4, 5, 6, 7, 8, 9]
      computer.choose_mark
      expect(computer.mark).to eql "O"
    end

    it "chooses X if first player made first move with O" do
      computer.board = TicTacToe::Board.new [1, "O", 3, 4, 5, 6, 7, 8, 9]
      computer.choose_mark
      expect(computer.mark).to eql "X"
    end
  end

  describe "#pick_move" do
    context "when it has two in a row" do
      it "places a third to get three in a row" do
        board = TicTacToe::Board.new ["X", "O", 3, 4, "X", 6, "O", 8 , 9]
        computer.board = board
        move = computer.pick_move
        board.mark_space(move, computer.mark)
        expect(board.grid).to eql ["X", "O", 3, 4, "X", 6, "O", 8 , "X"]
      end
    end

    context "when the opponent has two in a row" do
      it "plays the third to block the opponent" do
        board = TicTacToe::Board.new ["O", "O", 3, 4, "X", 6, 7, "X", 9]
        computer.board = board
        move = computer.pick_move
        board.mark_space(move, computer.mark)
        expect(board.grid).to eql ["O", "O", "X", 4, "X", 6, 7, "X", 9]
      end
    end

    context "when it has two non-blocked lines of two" do
      it "creates a fork (two threats to win)" do
        board = TicTacToe::Board.new ["X", "O", 3, 4, "X", 6, 7, 8, "O"]
        computer.board = board
        move = computer.pick_move
        board.mark_space(move, computer.mark)
        expect(board.grid).to eql ["X", "O", 3, "X", "X", 6, 7, 8, "O"]
      end
    end

    context "when opponent has the opportunity to create a fork" do
      it "creates two in a row to force the opponent into defending, without creating an opportunity for opponent to fork" do
        board = TicTacToe::Board.new [ "O", 2, 3, 4, "X", 6, 7, 8, "O"]
        computer.board = board
        move = computer.pick_move
        board.mark_space(move, computer.mark)
        expect(board.grid).to eql ["O", 2, 3, "X", "X", 6, 7, 8, "O"]
      end

      it "blocks opponent's fork" do
        board = TicTacToe::Board.new ["O", 2, 3, 4, "X", "O", 7, 8, 9]
        computer.board = board
        move = computer.pick_move
        board.mark_space(move, computer.mark)
        expect(board.grid).to eql ["O", 2, "X", 4, "X", "O", 7, 8, 9]
      end
    end

    context "when there is no opportunity to win, block, fork, or block a fork" do
      it "plays center" do
        board = TicTacToe::Board.new [1, 2, 3, 4, 5, 6, 7, 8, 9]
        computer.board = board
        move = computer.pick_move
        board.mark_space(move, computer.mark)
        expect(board.grid).to eql [1, 2, 3, 4, "X", 6, 7, 8, 9]
      end

      it "plays the opposite corner if the opponent is in a corner" do
        board = TicTacToe::Board.new ["O", 2, 3, 4, "X", 6, 7, 8, 9]
        computer.board = board
        move = computer.pick_move
        board.mark_space(move, computer.mark)
        expect(board.grid).to eql ["O", 2, 3, 4, "X", 6, 7, 8, "X"]
      end

      it "plays the first of the available corners if a corner is available" do
        board = TicTacToe::Board.new [1, 2, 3, 4, "O", 6, 7, 8, 9]
        computer.board = board
        move = computer.pick_move
        board.mark_space(move, computer.mark)
        expect(board.grid).to eql ["X", 2, 3, 4, "O", 6, 7, 8, 9]
      end

      it "plays the first of the four available sides if everything else is taken" do
        board = TicTacToe::Board.new ["X", "O", "X", 4, "X", "O", "O", "X", "O"]
        computer.board = board
        move = computer.pick_move
        board.mark_space(move, computer.mark)
        expect(board.grid).to eql ["X", "O", "X", "X", "X", "O", "O", "X", "O"]
      end
    end
  end
end
