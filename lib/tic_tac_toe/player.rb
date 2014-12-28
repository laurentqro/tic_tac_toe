module TicTacToe
  class Player
    attr_accessor :board, :display

    def initialize(mark: mark=nil)
      @mark = mark
    end

    def self.create(klass, mark)
      klass.send(:new, mark: mark)
    end

  end
end