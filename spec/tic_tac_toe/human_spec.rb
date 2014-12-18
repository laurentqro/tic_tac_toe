require 'tic_tac_toe/human'
require 'tic_tac_toe/board'
require 'tic_tac_toe/display'

describe TicTacToe::Human do

  let(:human) { TicTacToe::Human.new }

  it "has a mark" do
    expect(human).to respond_to :mark
  end

  describe "#make_move" do
    it "sets the human player's mark on a given space" do
      board = TicTacToe::Board.new [1, 2, 3, 4, 5, 6, 7, 8, 9]
      human.mark = "X"
      expect(board).to receive(:mark_space).with(3, "X").and_return([1, 2, "X", 4, 5, 6, 7, 8, 9])
      human.make_move(3, board)
    end
  end
end