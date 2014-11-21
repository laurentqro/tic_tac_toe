module TicTacToe

  class Board
    attr_reader :grid

    def initialize(grid=[1,2,3,4,5,6,7,8,9])
      @grid = grid
    end
  end
end
