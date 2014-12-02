module TicTacToe
  class GameController
    attr_reader :display, :game, :current_player, :human_mark

    def initialize(display: display, game: game)
      @display = display
      @game = game
    end

    # def start
      #  display_game_title
      #  display_choice_of_mark
      #  set_human_mark
      #  initialize board: TicTacToe::Board.new([1,2,3,4,5,6,7,8,9])
      #  initialize_computer_player: computer = TicTacToe::Computer.new(mark: computer_mark)
      #  initialize_game: game = TicTacToe::Game.new(computer: computer, board: board)
      #  set_current_player_to(:human)

      # until game.is_over? do
        #  make_move
        #  check_for_win
        #  check_for_draw
        #  next_player
      # end
    # end

    def display_game_title
      display.output_game_title
    end

    def display_choice_of_mark
      display.output_choice_of_mark
    end

    def set_human_mark
      choice_of_mark = display.get_user_input
      @human_mark = parse(choice_of_mark)
    end

    def set_computer_mark
      game.computer.mark = human_mark == "X" ? "O" : "X"
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
        space = display.get_user_input
        game.board.mark_space(space, human_mark)
      else
        game.computer.make_move(game.board)
      end
    end

    def next_player
      player = current_player == :human ? :computer : :human
      set_current_player_to(player)
    end

    private

    def parse(choice_of_mark)
      choice_of_mark == "1\n" ? "X" : "O"
    end

  end

end