require "spec_helper"
require_relative "../lib/computer"
require_relative "../lib/board"

describe TicTacToe::Computer do
  
  describe "#winning_space" do
    it "returns a winning space" do
      computer = TicTacToe::Computer.new(mark: "X")
      board = TicTacToe::Board.new ["X", "X", 3, 4, 5, 6, 7, 8, 9]
      expect(computer.winning_space(computer.mark, board)).to eql 3
    end
  end
  
  describe "#opponent_winning_space" do
    xit "returns the opponent's winning space" do
      computer = TicTacToe::Computer.new(mark: "X")
      board = TicTacToe::Board.new [1, 2, 3, 4, 5, 6, "O", "O", 9]
      expect(computer.opponent_winning_space).to eql 9
    end
  end

  describe "#make_move(space, board)" do
    it "sets the computer's mark on a given space" do
      computer = TicTacToe::Computer.new(mark: "X")
      board = TicTacToe::Board.new [1, 2, 3, 4, 5, 6, 7, 8, 9]
      computer.make_move(3, board)
      expect(board.grid).to eql [1, 2, "X", 4, 5, 6, 7, 8, 9]
    end
  end

end
