require 'tic_tac_toe/display'

describe TicTacToe::Display do

  let(:input) { StringIO.new("1\n") }
  let(:output) { StringIO.new }
  let(:display) { TicTacToe::Display.new(input: input, output: output) }

  describe "#output_game_title" do
    it "shows game title" do
      display.output_game_title
      expect(output.string).to eql "** TicTacToe **\n"
    end
  end

  describe "#get_mark" do
    it "asks first player to choose a mark X or O" do
      display.get_mark
      expect(output.string).to eql "Choose your mark:\n\s1: X\n\s2: O\n"
    end
  end

  describe "#get_move" do
    it "asks current player for his move" do
      display.get_move
      expect(output.string).to eql "Please enter the number of a space to mark it:\n"
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

  describe "#output_win_announcement" do
    it "announces human win" do
      display.output_win_announcement
      expect(output.string).to eql "Congratulations, you won!\n"
    end
  end

  describe "#output_loss_announcement" do
    it "announces human loss" do
      display.output_loss_announcement
      expect(output.string).to eql "Oh no, you lost!\n"
    end
  end

  describe "#output_draw_announcement" do
    it "announces draw" do
      display.output_draw_announcement
      expect(output.string).to eql "Draw!\n"
    end
  end
end