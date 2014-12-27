require 'tic_tac_toe/human'
require 'tic_tac_toe/display'

describe TicTacToe::Human do

  let(:human) { TicTacToe::Human.new(mark: "X") }
  let(:display) { TicTacToe::Display.new(input: StringIO.new, output: StringIO.new) }

  it "has a mark" do
    expect(human).to respond_to :mark
  end

  describe "#pick_move" do
    it "sets the human player's mark on a given space" do
      allow(display).to receive(:get_move)
      human.display = display
      human.pick_move
      expect(display).to have_received(:get_move)
    end
  end
end