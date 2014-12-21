module TicTacToe
  class Game
    attr_reader :board, :computer, :human, :display
    attr_accessor :current_player

    def initialize(board: board, computer: computer, human: human, display: display)
      @board = board
      @computer = computer
      @human = human
      @display = display
      @current_player = human
    end

    def is_over?
      is_won? || is_draw?
    end

    def is_won?
      board.winner?
    end

    def is_draw?
      board.draw?
    end

    def next_player
      @current_player == human ? @current_player = computer : @current_player = human
    end

    def make_move
      move = get_move_from(current_player)
      current_player.make_move(move, board)
      display.clear_screen
    end

    def display_board
      display.output_board(board.grid)
    end

    def display_outcome
      if is_won? && current_player == human
        display.output_win_announcement
      end

      if is_won? && current_player != human
        display.output_loss_announcement
      end

      if is_draw?
        display.output_draw_announcement
      end
    end

    private

    def get_move_from(current_player)
      if current_player == human
        display.get_move
      else
        computer.pick_move(board)
      end
    end

  end
end