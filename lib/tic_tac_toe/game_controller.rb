module TicTacToe
  class GameController
    attr_reader :display

    def initialize(display: display)
      @display = display
    end

    def display_game_title
      display.game_title
    end
  end
end