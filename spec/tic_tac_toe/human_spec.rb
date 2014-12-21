require 'tic_tac_toe/human'
require 'tic_tac_toe/board'
require 'tic_tac_toe/display'

describe TicTacToe::Human do

  let(:human) { TicTacToe::Human.new }
  let(:input) { StringIO.new }
  let(:output) { StringIO.new }
  let(:display) { TicTacToe::Display.new(input: input, output: output) }
  let(:board) { TicTacToe::Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9]) }

  it "has a mark" do
    expect(human).to respond_to :mark
  end

  describe "#make_move" do
    it "sets the human player's mark on a given space" do
      allow(board).to receive(:mark_space)
      human.mark = "X"
      human.make_move(3, board)
      expect(board).to have_received(:mark_space).with(3, "X")
    end
  end
end