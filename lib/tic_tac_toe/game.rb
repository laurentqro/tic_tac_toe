module TicTacToe
  class Game
    attr_reader :board, :computer, :human, :display
    attr_accessor :current_player

    def initialize(board: board, computer: computer, human: human, display: display)
      @board = board
      @computer = computer
      @human = human
      @display = display
      @human.display = @display
      @current_player = human
    end

    def play
      set_human_mark
      display.output_board(board.grid)

      until board.winner? || board.draw?  do
        make_move(current_player)
        next_player
      end

      display_outcome
    end

    def set_human_mark
      human.mark = parse(display.get_mark)
    end

    def next_player
      @current_player == human ? @current_player = computer : @current_player = human
    end

    def make_move(player)
      move = player.pick_move(board)
      board.mark_space(move, player.mark)
      display.clear_screen
      display.output_board(board.grid)
    end

    def display_outcome
      if board.winner? && current_player == human
        display.output_win_announcement
      end

      if board.winner? && current_player != human
        display.output_loss_announcement
      end

      if board.draw?
        display.output_draw_announcement
      end
    end

    private

    def parse(choice_of_mark)
      choice_of_mark == 1 ? "X" : "O"
    end

  end
end