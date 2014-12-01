module TicTacToe
  class Game
    attr_reader :display

    def initialize(display: display)
      @display = display
    end

    def start
      display.game_title
    end
  end
end