module TicTacToe
  class GameController
    attr_reader :display, :game

    def initialize(display: display, game: game)
      @display = display
      @game = game
    end

    def display_game_title
      display.output_game_title
    end

    def display_choice_of_mark
      display.output_choice_of_mark
    end

    def set_human_mark_with(choice_of_mark)
      game.human_mark = parse(choice_of_mark)
    end

    def display_board
      grid = game.board.grid[:grid]
      display.output_board(grid)
    end

    def set_current_player_to(player)
      game.current_player = player
    end

    private

    def parse(choice_of_mark)
      choice_of_mark == "1\n" ? "X" : "O"
    end

  end

end