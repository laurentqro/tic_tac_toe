module TicTacToe
  class Human
    attr_accessor :mark, :display

    def pick_move
      display.get_move
    end
  end
end