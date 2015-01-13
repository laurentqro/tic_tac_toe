module TicTacToe
  class GameState
    attr_accessor :board, :current_player

    def initialize(board, current_player)
      self.board = board
      self.current_player = current_player
    end

    def score
      if board.draw?
        return 0
      end

      if board.winning_mark == current_player.mark
        return 1
      else
        return -1
      end
    end

  end
end