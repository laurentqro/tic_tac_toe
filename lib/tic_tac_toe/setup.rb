module TicTacToe
  class Setup
    attr_reader :display

    def initialize(display)
      @display = display
    end

    def player(mark)
      player_type_choice = display.get_player_type_for(mark)
      player_type_choice == 1 ? player_type = TicTacToe::Human : player_type = TicTacToe::Computer
      TicTacToe::Player.create(player_type, mark)
    end
  end
end