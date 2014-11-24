module TicTacToe
  class Computer
    attr_accessor :mark
    
    def initialize(mark: mark)
      @mark = mark
    end
    
    def winning_space(mark, board)
      winning_line = (board.rows + board.columns + board.diagonals).find do
        |line| winning_space_on_line?(mark, line)
      end
      available_space_on_line(winning_line)
    end

    def make_move(space, board)
      board.mark_space(space, mark)
    end

    private

    def winning_space_on_line?(mark, line)
      two_in_a_row_on_line?(mark, line) && available_space_on_line?(line)
    end

    def two_in_a_row_on_line?(mark, line)
      line.count(mark) == 2
    end

    def available_space_on_line(line)
      line.grep(Integer)[0]
    end

    def available_space_on_line?(line)
      available_space_on_line(line) != nil
    end

  end
end
