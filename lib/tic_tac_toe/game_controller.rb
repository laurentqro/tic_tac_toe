module TicTacToe
  class GameController
    attr_reader :game

    def initialize(game: game)
      @game = game
    end

    def start
      game.set_human_mark
      display_board

      until game.is_over? do
        make_move
        display_board
        next_player
      end

      display_game_outcome
    end

    def display_board
      game.display_board
    end

    def make_move
      game.make_move
    end

    def next_player
      game.next_player
    end

    def display_game_outcome
      game.display_outcome
    end
  end
end