module TicTacToe
  class GameState
    attr_reader :board, :current_player_mark, :max_player_mark

    def initialize(board, current_player_mark, max_player_mark)
      @board = board
      @current_player_mark = current_player_mark
      @max_player_mark = max_player_mark
    end

    def final_state_score
      return 0 if board.draw?
      return 1 if board.winning_mark == max_player_mark
      return -1
    end
  end
end