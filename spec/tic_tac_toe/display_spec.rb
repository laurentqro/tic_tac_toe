require 'tic_tac_toe/display'

describe TicTacToe::Display do

  let(:input) { StringIO.new }
  let(:output) { StringIO.new }
  let(:display) { TicTacToe::Display.new(input: input, output: output) }

  describe "#game_title" do
    it "shows game title" do
      display.game_title
      expect(output.string).to eql "** TicTacToe **\n"
    end
  end

  describe "#choice_of_mark" do
    it "asks human player to choose a mark X or O" do
      display.choice_of_mark
      expect(output.string).to eql "Choose your mark:\n1: X\n 2: O\n"
    end
  end
end