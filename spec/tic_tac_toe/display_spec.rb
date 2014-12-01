require 'tic_tac_toe/display'

describe TicTacToe::Display do
  describe "#game_title" do
    it "shows game title" do
      input = StringIO.new
      output = StringIO.new
      display = TicTacToe::Display.new(input: input, output: output)
      display.game_title
      expect(output.string).to eql "** TicTacToe **\n"
    end
  end
end