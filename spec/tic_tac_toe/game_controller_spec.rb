require 'tic_tac_toe/game_controller'
require 'tic_tac_toe/game'
require 'tic_tac_toe/human'

describe TicTacToe::GameController do

  let(:input) { StringIO.new }
  let(:output) { StringIO.new }
  let(:display) { TicTacToe::Display.new(input: input, output: output) }
  let(:board) { TicTacToe::Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9]) }
  let(:human) { TicTacToe::Human.new }
  let(:computer) { TicTacToe::Computer.new }
  let(:game) { TicTacToe::Game.new(board: board, computer: computer, human: human) }
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

  describe "#set_computer_mark" do
    it "sets computer mark to O if first player picked X" do
      board = TicTacToe::Board.new(["X", 2, 3, 4, 5, 6, 7, 8, 9])
      game = TicTacToe::Game.new(board: board, computer: computer, human: human)
      controller = TicTacToe::GameController.new(display: display, game: game)
      controller.set_computer_mark
      expect(game.computer.mark).to eql "O"
    end

    it "sets computer mark to X if first player picked O" do
      board = TicTacToe::Board.new(["O", 2, 3, 4, 5, 6, 7, 8, 9])
      game = TicTacToe::Game.new(board: board, computer: computer, human: human)
      controller = TicTacToe::GameController.new(display: display, game: game)
      controller.set_computer_mark
      expect(game.computer.mark).to eql "X"
    end
  end

  describe "#set_human_mark" do
    it "sets human mark to X" do
      input = StringIO.new("1\n")
      display = TicTacToe::Display.new(input: input, output: output)
      controller = TicTacToe::GameController.new(display: display, game: game)
      controller.set_human_mark
      expect(game.human.mark).to eql "X"
    end

    it "sets human mark to O" do
      input = StringIO.new("2\n")
      display = TicTacToe::Display.new(input: input, output: output)
      controller = TicTacToe::GameController.new(display: display, game: game)
      controller.set_human_mark
      expect(game.human.mark).to eql "O"
    end
  end

  describe "#display_board" do
    it "displays the current game's board" do
      board = TicTacToe::Board.new([1, 2, 3, 4, "X", 6, "O", 8, 9])
      game = TicTacToe::Game.new(board: board, computer: computer, human: human)
      controller = TicTacToe::GameController.new(display: display, game: game)
      controller.display_board
      expect(output.string).to eql " 1 | 2 | 3\n---+---+---\n 4 | X | 6\n---+---+---\n O | 8 | 9\n"
    end
  end

  describe "#make_move" do
    it "tells the human player to make his move" do
      board = TicTacToe::Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
      game = TicTacToe::Game.new(board: board, computer: computer, human: human)
      input = StringIO.new("5\n")
      display = TicTacToe::Display.new(input: input, output: output)
      controller = TicTacToe::GameController.new(display: display, game: game)
      game.human.mark = "X"
      game.current_player = human
      controller.make_move
      expect(game.board.grid).to include "X" || "O"
    end
  end

  describe "#next_player" do
    it "switches current player to opponent" do
      controller.set_current_player_to(human)
      controller.next_player
      expect(game.current_player).to eql computer
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
        game = TicTacToe::Game.new(board: board, computer: computer, human: human)
        controller = TicTacToe::GameController.new(display: display, game: game)
        game.current_player = human
        game.human.mark = "X"
        expect(controller.game.is_won?).to eql true
        controller.display_game_outcome
        expect(output.string).to eql "Congratulations, you won!\n"
      end

      it "announces loss if human player lost" do
        board = TicTacToe::Board.new(["O", 2, 3, 4, "O", 6, "X", "X", "O"])
        game = TicTacToe::Game.new(board: board, computer: computer, human: human)
        controller = TicTacToe::GameController.new(display: display, game: game)
        game.current_player = computer
        game.human.mark = "X"
        expect(controller.game.is_won?).to eql true
        controller.display_game_outcome
        expect(output.string).to eql "Oh no, you lost!\n"
      end
    end

    context "when the game draws" do
      it "announces draw" do
        board = TicTacToe::Board.new(["X", "O", "X", "X", "O", "O", "O", "X", "X"])
        game = TicTacToe::Game.new(board: board, computer: computer, human: human)
        controller = TicTacToe::GameController.new(display: display, game: game)
        expect(controller.game.is_draw?).to eql true
        controller.display_game_outcome
        expect(output.string).to eql "Draw!\n"
      end
    end
  end
end