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
      triples.any? { |triple| triple.uniq.count == 1 }
    end

    def draw?
      available_moves == []
    end

    def triples
      rows + columns + diagonals
    end
    
    private

    def rows
      grid.each_slice(3).to_a
    end

    def columns
     rows.transpose
    end

    def diagonals
     [] << right_diagonal << left_diagonal
    end
 
    def right_diagonal
      rows.each_with_index.map { |row, index| row[index] }
    end

    def left_diagonal
      rows.reverse.each_with_index.map { |row, index| row[index] }.reverse
    end

  end
end
