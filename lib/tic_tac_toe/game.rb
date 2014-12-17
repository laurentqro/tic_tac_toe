module TicTacToe
  class Game
    attr_reader :board, :computer, :human

    def initialize(board: board, computer: computer, human: human)
      @board = board
      @computer = computer
      @human = human
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