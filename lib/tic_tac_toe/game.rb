module TicTacToe
  class Game
    attr_reader :board, :computer

    def initialize(board: board, computer: computer)
      @board = board
      @computer = computer
    end
  end
end