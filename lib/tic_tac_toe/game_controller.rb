module TicTacToe
  class GameController
    attr_reader :display, :game

    def initialize(display: display, game: game)
      @display = display
      @game = game
    end

    def start
      display_choice_of_mark
      display_board
      set_human_mark
      set_computer_mark

      until game.is_over? do
        make_move
        next_player
      end

      display_game_outcome
    end

    def display_choice_of_mark
      display.get_mark
    end

    def display_board
      game.display_board
    end

    def set_computer_mark
      game.computer.choose_mark(game.board)
    end

    def set_human_mark
      game.human.mark = parse(display.get_mark)
    end

    def make_move
      game.make_move
    end

    def next_player
      game.next_player
    end

    def display_game_outcome
      game.display_outcome
    end

    private

    def parse(choice_of_mark)
      choice_of_mark == 1 ? "X" : "O"
    end
  end
end