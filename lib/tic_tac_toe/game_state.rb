module TicTacToe
  class GameState
    attr_reader :board, :current_player_mark
    attr_accessor :successors

    def initialize(board, current_player_mark)
      @board = board
      @current_player_mark = current_player_mark
      @successors = []
    end

    def score
      if board.draw?
        return 0
      end

      if board.winning_mark == current_player_mark
        return 1
      else
        return -1
      end
    end

    def generate_successors
      next_player_mark = (current_player_mark == "X" ? "O" : "X")
      board.available_moves.each do |space|
        next_board = TicTacToe::Board.new(board.grid.dup)
        next_board.mark_space(space, current_player_mark)
        @successors << TicTacToe::GameState.new(next_board, next_player_mark)
      end
    end
  end
end