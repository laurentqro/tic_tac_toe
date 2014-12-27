module TicTacToe
  class Human < Player
    attr_reader :mark

    def pick_move
      display.get_move
    end
  end
end