require "spec_helper"
require_relative "../lib/computer"
require_relative "../lib/board"

describe TicTacToe::Computer do
 describe "#check_for_winning_space_on" do
    it "returns a winning space" do
      computer = TicTacToe::Computer.new(mark: "X")
      board = TicTacToe::Board.new ["X", "X", 3, 4, 5, 6, 7, 8, 9]
      expect(computer.check_for_winning_space_on(board)).to eql 3
    end
  end
end
