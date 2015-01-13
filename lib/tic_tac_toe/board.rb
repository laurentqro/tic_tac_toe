module TicTacToe
  class Board
    attr_reader :grid
    attr_accessor :winning_mark

    def initialize(grid=[1, 2, 3, 4, 5, 6, 7, 8, 9])
      @grid = grid
    end

    def mark_space(space, mark)
      raise "Invalid move" if !is_valid_move?(space)
      grid[space - 1] = mark
      grid
    end

    def available_moves
      grid.grep(Integer)
    end

    def winner?
      triples.any? { |triple| triple.uniq.count == 1 }
    end

    def draw?
      winner? == false && available_moves == []
    end

    def triples
      rows + columns + diagonals
    end

    def corners
      grid.values_at(0, 2, 6, 8)
    end

    def opposite_corner(space_index)
      opposite_corner = {
        0 => grid[8],
        2 => grid[6],
        6 => grid[2],
        8 => grid[0]
      }
      opposite_corner[space_index]
    end

    def is_valid_move?(space)
      available_moves.include?(space)
    end

    def winning_mark
      @winner ||= WINNING_COMBINATIONS.collect { |positions|
        (grid[positions[0]] == grid[positions[1]] &&
          grid[positions[1]] == grid[positions[2]] &&
          grid[positions[0]]) || nil
      }.compact.first
    end

    private

    WINNING_COMBINATIONS =  [0, 1, 2],
                            [3, 4, 5],
                            [6, 7, 8],
                            [0, 3, 6],
                            [1, 4, 7],
                            [2, 5, 8],
                            [0, 4, 8],
                            [6, 4, 2]

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
