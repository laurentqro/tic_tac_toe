module TicTacToe
  class Computer
    attr_accessor :mark
    
    def initialize(mark: mark)
      @mark = mark
    end
    
    def check_for_winning_space_on(board)
      winning_row_col_or_diag = (board.rows + board.columns + board.diagonals).find do
        |row_col_or_diag| winning_space?(row_col_or_diag)
      end
      winning_row_col_or_diag.grep(Integer)[0]
    end

    private

    def winning_space?(row_col_or_diag)
       two_in_a_row?(row_col_or_diag) && available_space?(row_col_or_diag)
    end

    def two_in_a_row?(row_col_or_diag)
      row_col_or_diag.count(mark) == 2
    end

    def available_space?(row_col_or_diag)
      row_col_or_diag.grep(Integer).any?
    end

  end
end
