require 'tic_tac_toe/display'

describe TicTacToe::Display do

  let(:input) { StringIO.new }
  let(:output) { StringIO.new }
  let(:display) { TicTacToe::Display.new(input: input, output: output) }

  describe "#output_game_title" do
    it "shows game title" do
      display.output_game_title
      expect(output.string).to eql "** TicTacToe **\n"
    end
  end

  describe "#output_choice_of_mark" do
    it "asks human player to choose a mark X or O" do
      display.output_choice_of_mark
      expect(output.string).to eql "Choose your mark:\n1: X\n 2: O\n"
    end
  end

  describe "#get_user_input" do
    it "asks human player for input" do
      input = StringIO.new("1\n")
      output = StringIO.new
      display = TicTacToe::Display.new(input: input, output: output)
      expect(display.get_user_input).to eql 1
    end
  end

  describe "#clear_screen" do
    it "clears the terminal screen" do
      display.clear_screen
      expect(output.string).to eql "\e[2J\e[f\n"
    end
  end

  describe "#output_line_space" do
    it "inserts a line space" do
      display.output_line_space
      expect(output.string).to eql "\s\n"
    end
  end

end