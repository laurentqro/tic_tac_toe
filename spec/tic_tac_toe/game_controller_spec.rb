require 'tic_tac_toe/game_controller'
require 'tic_tac_toe/game'

describe TicTacToe::GameController do

  let(:input) { StringIO.new }
  let(:output) { StringIO.new }
  let(:display) { TicTacToe::Display.new(input: input, output: output) }
  let(:board) { TicTacToe::Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9]) }
  let(:computer) { TicTacToe::Computer.new }
  let(:game) { TicTacToe::Game.new(board: board, computer: computer) }
  let(:controller) { TicTacToe::GameController.new(display: display, game: game) }

  describe "#display_game_title" do
    it "displays game title" do
      controller.display_game_title
      expect(output.string).to eql "** TicTacToe **\n"
    end
  end

  describe "#display_choice_of_mark" do
    it "tells the human player to choose X or O mark" do
      controller.display_choice_of_mark
      expect(output.string).to eql "Choose your mark:\n\s1: X\n\s2: O\n"
    end
  end

  describe "#set_players_marks" do
    it "sets computer mark to O if human picked X" do
      allow(display).to receive(:get_user_input) { 1 }
      controller.set_players_marks
      expect(controller.human_mark).to eql "X"
      expect(computer.mark).to eql "O"
    end

    it "sets computer mark to X if human picked O" do
      allow(display).to receive(:get_user_input) { 2 }
      controller.set_players_marks
      expect(controller.human_mark).to eql "O"
      expect(computer.mark).to eql "X"
    end
  end

  describe "#display_board" do
    it "displays the current game's board" do
      board = TicTacToe::Board.new([1, 2, 3, 4, "X", 6, "O", 8, 9])
      game = TicTacToe::Game.new(board: board, computer: computer)
      controller = TicTacToe::GameController.new(display: display, game: game)
      controller.display_board
      expect(output.string).to eql " 1 | 2 | 3\n---+---+---\n 4 | X | 6\n---+---+---\n O | 8 | 9\n"
    end
  end

  describe "#set_current_player_to" do
    it "sets the active game's current player" do
      controller.set_current_player_to(:human)
      expect(controller.current_player).to eql :human
    end
  end

  describe "#make_move" do
    it "tells the current player to make his move" do
      allow(controller).to receive(:human_mark) { "X" }
      allow(controller).to receive(:current_player) { :human }
      allow(display).to receive(:get_user_input) { 1 }
      controller.make_move
      expect(game.board.grid).to eql ["X", 2, 3, 4, 5, 6, 7, 8, 9]
    end
  end

  describe "#next_player" do
    it "sets the current player to the next player" do
      controller.set_current_player_to(:human)
      controller.next_player
      expect(controller.current_player).to eql :computer
    end
  end

  describe "#prompt_for_move" do
    it "prompts the user to enter his move" do
      controller.prompt_for_move
      expect(output.string).to eql "Please enter the number of a space to mark it:\n"
    end
  end

  describe "#clear_screen" do
    it "tells the display to clear the screen" do
      controller.clear_screen
      expect(output.string).to eql "\e[2J\e[f\n"
    end
  end

  describe "#insert_line_space" do
    it "tells the display to insert line space" do
      controller.insert_line_space
      expect(output.string).to eql "\s\n"
    end
  end

  describe "#display_game_outcome" do
    context "when there is a winner" do
      it "announces win if human player won" do
        board = TicTacToe::Board.new(["X", 2, 3, 4, "X", 6, "O", "O", "X"])
        game = TicTacToe::Game.new(board: board, computer: computer)
        controller = TicTacToe::GameController.new(display: display, game: game)
        allow(controller).to receive(:current_player) { :human }
        allow(controller).to receive(:human_mark) { "X" }
        expect(controller.game.is_won?).to eql true
        controller.display_game_outcome
        expect(output.string).to eql "Congratulations, you won!\n"
      end

      it "announces loss if human player lost" do
        board = TicTacToe::Board.new(["O", 2, 3, 4, "O", 6, "X", "X", "O"])
        game = TicTacToe::Game.new(board: board, computer: computer)
        controller = TicTacToe::GameController.new(display: display, game: game)
        allow(controller).to receive(:current_player) { :computer }
        allow(controller).to receive(:human_mark) { "X" }
        expect(controller.game.is_won?).to eql true
        controller.display_game_outcome
        expect(output.string).to eql "Oh no, you lost!\n"
      end
    end

    context "when the game draws" do
      it "announces draw" do
        board = TicTacToe::Board.new(["X", "O", "X", "X", "O", "O", "O", "X", "X"])
        game = TicTacToe::Game.new(board: board, computer: computer)
        controller = TicTacToe::GameController.new(display: display, game: game)
        allow(controller).to receive(:current_player) { :human }
        allow(controller).to receive(:human_mark) { "X" }
        expect(controller.game.is_draw?).to eql true
        controller.display_game_outcome
        expect(output.string).to eql "Draw!\n"
      end
    end
  end

  describe "#get_valid_move" do
    it "asks player for move until he enters a valid move" do
      board = TicTacToe::Board.new(["O", 2, 3, 4, "O", 6, "X", "X", "O"])
      game = TicTacToe::Game.new(board: board, computer: computer)
      controller = TicTacToe::GameController.new(display: display, game: game)
      allow(controller).to receive(:current_player) { :human_mark }
      allow(controller).to receive(:human_mark) { "X" }
      allow(display).to receive(:get_user_input) { [2, 3, 4, 6].sample }
      expect([2, 3, 4, 6]).to include controller.get_valid_move
    end
  end
end