require 'tic_tac_toe/display'

describe TicTacToe::Display do

  let(:input) { StringIO.new("1\n") }
  let(:output) { StringIO.new }
  let(:display) { TicTacToe::Display.new(input: input, output: output) }

  describe "#output_game_title" do
    it "shows game title" do
      display.output_game_title
      expect(output.string).to eql "\e[2J\e[f\n** TicTacToe **\n \n"
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

  describe "#output_board" do
    it "displays the current game's board" do
      grid = [1, 2, 3, 4, "X", 6, "O", 8, 9]
      display.output_board(grid)
      expect(output.string).to eql "\e[2J\e[f\n** TicTacToe **\n \n 1 | 2 | 3\n---+---+---\n 4 | X | 6\n---+---+---\n O | 8 | 9\n \n"
    end
  end

  describe "#output_win_announcement_for" do
    it "announces winner" do
      display.output_win_announcement_for("X")
      expect(output.string).to eql "X won!\n"
    end
  end

  describe "#output_draw_announcement" do
    it "announces draw" do
      display.output_draw_announcement
      expect(output.string).to eql "Draw!\n"
    end
  end

  describe "#output_invalid_move_message" do
    it "alerts the player of an invalid move" do
      display.output_invalid_move_message
      expect(output.string).to eql "You entered an invalid move.\s"
    end
  end

  describe "#get_player_type" do
    it "asks the user to choose a player type for X" do
      display.get_player_type_for("X")
      expect(output.string).to eql "Who will be player X?\n\s1: Human\n\s2: Computer\n"
    end

    it "asks the user to choose a player type for O" do
      display.get_player_type_for("O")
      expect(output.string).to eql "Who will be player O?\n\s1: Human\n\s2: Computer\n"
    end
  end

end