module TicTacToe
  class Game
    attr_reader :board, :computer, :human
    attr_accessor :current_player

    def initialize(board: board, computer: computer, human: human)
      @board = board
      @computer = computer
      @human = human
      @current_player = nil
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
      @current_player.make_move(board)
    end
  end
end