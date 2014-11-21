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
      board.mark_space(1, "X")
      board.mark_space(6, "O")
      expect(board.available_moves).to eql [2,3,4,5,7,8,9]
    end
  end
end

