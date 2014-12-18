module TicTacToe
  class Human
    attr_accessor :mark

    def make_move(space, board)
      board.mark_space(space, mark)
    end
  end
end