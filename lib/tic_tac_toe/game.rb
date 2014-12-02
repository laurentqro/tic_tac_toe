module TicTacToe
  class Game
    attr_reader :board, :computer

    def initialize(board: board, computer: computer)
      @board = board
      @computer = computer
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
  end
end