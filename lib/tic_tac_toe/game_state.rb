module TicTacToe
  class GameState
    attr_reader :board, :current_player_mark
    attr_accessor :children

    def initialize(board, current_player_mark)
      @board = board
      @current_player_mark = current_player_mark
      @children = []
    end

    def generate_tree
      next_player_mark = (current_player_mark == "X" ? "O" : "X")
      board.available_moves.each do |move|
        next_board = TicTacToe::Board.new(board.grid.dup)
        next_board.mark_space(move, current_player_mark)
        child_game_state = TicTacToe::GameState.new(next_board, next_player_mark)
        children << child_game_state
        child_game_state.generate_tree
      end
    end

    def final_state_score
      return 0 if board.draw?
      return 1 if board.winning_mark == current_player_mark
      return -1
    end
  end
end