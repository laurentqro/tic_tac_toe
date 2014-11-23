module TicTacToe

  class Board
    attr_reader :grid

    def initialize(grid=[1, 2, 3, 4, 5, 6, 7, 8, 9])
      @grid = grid
    end

    def mark_space(space, mark)
      @grid[space - 1] = mark
    end

    def available_moves
     @grid.grep(Integer)
    end

    def winner?
     WINNING_COMBINATIONS.include? @grid
    end

    def draw?
      available_moves == []
    end

    def rows
      grid.each_slice(3).to_a
    end

    def columns
     rows.transpose
    end

    def diagonals
     [] << right_diagonal << left_diagonal
    end

    private

    WINNING_COMBINATIONS =  [
      ["X", "X", "X", 4, 5, 6, 7, 8, 9],
      [1, 2, 3, "X", "X", "X", 7, 8, 9],
      [1, 2, 3, 4, 5, 6, "X", "X", "X"],
      ["X", 2, 3, "X", 5, 6, "X", 8, 9],
      [1, "X", 3, 4, "X", 6, 7, "X", 9],
      [1, 2, "X", 4, 5, "X", 7, 8, "X"],
      ["X", 2, 3, 4, "X", 6, 7, 8, "X"],
      [1, 2, "X", 4, "X", 6, "X", 8, 9]
    ]
    
    def right_diagonal
      rows.each_with_index.map { |row, index| row[index] }
    end

    def left_diagonal
      rows.reverse.each_with_index.map { |row, index| row[index] }.reverse
    end

  end
end
