module TicTacToe
  class Human
    attr_accessor :mark, :display

    def pick_move(board)
      display.get_move
    end
  end
end