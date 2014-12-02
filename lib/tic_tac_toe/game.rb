module TicTacToe
  class Game
    attr_accessor :human_mark, :board, :current_player

    def initialize(board: board)
      @board = board
    end
  end
end