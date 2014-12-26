module TicTacToe
  class Game
    attr_reader :board, :computer, :human, :display
    attr_accessor :current_player

    def initialize(board: board=nil, computer: computer=nil, human: human=nil, display: display=nil)
      @board = board
      @computer = computer
      @computer.board = @board
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
      move = get_valid_move_from(player)
      board.mark_space(move, player.mark)
      display.clear_screen
      display.output_board(board.grid)
    end

    def get_valid_move_from(player)
      move = player.pick_move
      until board.is_valid_move?(move)
        move = player.pick_move
      end
      return move
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