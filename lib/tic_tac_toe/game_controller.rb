module TicTacToe
  class GameController
    attr_reader :display, :game, :current_player

    def initialize(display: display, game: game)
      @display = display
      @game = game
    end

    def start
      clear_screen
      display_game_title
      insert_line_space
      display_choice_of_mark
      set_players_marks
      set_current_player_to(:human)
      insert_line_space
      display_board
      insert_line_space
      prompt_for_move
      make_move

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
      @current_player = player
    end

    def make_move
      if current_player == :human
        space = get_valid_move
        game.board.mark_space(space, human_mark)
      else
        game.computer.make_move(game.board)
      end
    end

    def get_valid_move
      chosen_space = display.get_user_input
      until game.board.is_valid_move?(chosen_space)
        display_invalid_move_message
        prompt_for_move
        chosen_space = display.get_user_input
      end
      chosen_space
    end

    def next_player
      player = current_player == :human ? :computer : :human
      set_current_player_to(player)
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
      if game.is_won? && current_player == :human
        display.output_win_announcement
      end

      if game.is_won? && current_player != :human
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