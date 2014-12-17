require 'tic_tac_toe/human'

describe TicTacToe::Human do
  it "has a mark" do
    human = TicTacToe::Human.new
    expect(human).to respond_to :mark
  end
end