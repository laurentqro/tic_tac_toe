module TicTacToe
  class Game
    attr_accessor :human_mark, :board

    def initialize(board: board)
      @board = board
    end
  end
end