require "spec_helper"
require_relative "../lib/board.rb"

describe TicTacToe::Board do
  let (:board) { TicTacToe::Board.new }
  
  it "has a 3x3 grid" do
    expect(board.grid).to eql [1,2,3,4,5,6,7,8,9]
  end

  describe "#mark_space" do
    it "marks a space with a mark" do
      mark = ["X", "O"].sample
      board.mark_space(1, mark)
      expect(board.grid).to eql [mark, 2,3,4,5,6,7,8,9]
    end
  end
  
  describe "#available_moves" do
    it "lists all available moves" do
      board = TicTacToe::Board.new ["X", 2, 3, 4, 5, "X", 7, 8, 9]
      expect(board.available_moves).to eql [2, 3, 4, 5, 7, 8, 9]
    end
  end

  describe "#winner?" do
    it "checks for a winner" do
      board_1 = TicTacToe::Board.new ["X", "X", "X", 4, 5, 6, 7, 8, 9]
      board_2 = TicTacToe::Board.new ["X", "O", "X", 4, 5, 6, 7, 8, 9]
      expect(board_1.winner?).to eql true
      expect(board_2.winner?).to eql false
    end
  end

  describe "#draw?" do
    it "checks for a draw" do
      board = TicTacToe::Board.new ["X", "O", "X", "O", "X", "O", "X", "O", "X"]
      expect(board.draw?).to eql true
    end
  end

  describe "#rows" do
    it "returns the rows on the board" do
      board = TicTacToe::Board.new ["X", "O", "X", 4, "O", 6, 7, 8, 9]
      expect(board.rows).to eql [["X", "O", "X"], [4, "O", 6], [7, 8, 9]]
    end
  end
  
  describe "#columns" do
    it "returns the columns on the board" do
      board = TicTacToe::Board.new ["X", "O", "X", 4, "O", 6, 7, 8, 9]
      expect(board.columns).to eql [["X", 4, 7], ["O", "O", 8], ["X", 6, 9]]
    end
  end

  describe "#diagonals" do
    it "returns the diagonals on the board" do
      board = TicTacToe::Board.new ["X", "O", "X", 4, "O", 6, 7, 8, 9]
      expect(board.diagonals).to eql [["X", "O", 9], ["X", "O", 7]]
    end
  end

end

