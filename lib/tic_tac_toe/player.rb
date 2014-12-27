module TicTacToe
  class Player
    attr_accessor :board, :display

    def initialize(mark: mark=nil)
      @mark = mark
    end
  end
end