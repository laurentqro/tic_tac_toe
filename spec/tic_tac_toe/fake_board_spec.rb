require "tic_tac_toe/fake_board"

describe TicTacToe::FakeBoard do
  it "inherits from TicTacToe::Board" do
    fake_board = TicTacToe::FakeBoard.new
    TicTacToe::Board.instance_methods.each do |method|
      expect(fake_board).to respond_to method
    end
  end
end