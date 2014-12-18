module TicTacToe
  class GameController
    attr_reader :display, :game

    def initialize(display: display, game: game)
      @display = display
      @game = game
    end

    def start
      clear_screen
      display_game_title
      insert_line_space
      display_choice_of_mark
      set_human_mark
      set_current_player_to(game.human)
      insert_line_space
      display_board
      insert_line_space
      prompt_for_move
      make_move
      set_computer_mark

      until game.is_over? do
        next_player
        prompt_for_move
        make_move
        clear_screen
        display_game_title
        insert_line_space
        display_board
        insert_line_space
      end

      clear_screen
      display_board
      insert_line_space
      display_game_outcome
    end

    def display_game_title
      display.output_game_title
    end

    def display_choice_of_mark
      display.output_choice_of_mark
    end

    def set_computer_mark
      game.computer.choose_mark(game.board)
    end

    def set_human_mark
      choice_of_mark = display.get_user_input
      game.human.mark = parse(choice_of_mark)
    end

    def display_board
      grid = game.board.grid
      display.output_board(grid)
    end

    def set_current_player_to(player)
      game.current_player = player
    end

    def make_move
      game.make_move
    end

    def next_player
      game.next_player
    end

    def prompt_for_move
      display.output_prompt_for_move
    end

    def clear_screen
      display.clear_screen
    end

    def insert_line_space
      display.output_line_space
    end

    def display_game_outcome
      if game.is_won? && game.current_player == game.human
        display.output_win_announcement
      end

      if game.is_won? && game.current_player != game.human
        display.output_loss_announcement
      end

      if game.is_draw?
        display.output_draw_announcement
      end
    end

    def display_invalid_move_message
      display.output_invalid_move_message
    end

    private

    def parse(choice_of_mark)
      choice_of_mark == 1 ? "X" : "O"
    end

  end
end