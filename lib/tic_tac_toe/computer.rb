require 'tic_tac_toe/player'
require 'tic_tac_toe/game_state'

module TicTacToe
  class Computer < Player
    attr_accessor :mark

    def choose_mark
      opponent_mark = ["X", "O"].find { |mark| board.grid.grep(mark).count.odd? }
      opponent_mark == "X" ? @mark = "O" : @mark = "X"
    end

    def pick_move
      mark = @mark || choose_mark
      minimax( GameState.new(board, mark, mark) )
    end

    private

    def minimax(game_state, depth = 0, move_scores = {})
      return game_state.final_state_score if game_state.board.winner? || game_state.board.draw?
      next_player_mark = (game_state.current_player_mark == "X" ? "O" : "X")

      game_state.board.available_moves.each do |move|
        next_board = TicTacToe::Board.new(game_state.board.grid.dup)
        next_board.mark_space(move, game_state.current_player_mark)
        next_game_state = TicTacToe::GameState.new(next_board, next_player_mark, game_state.max_player_mark)
        move_scores[move] = minimax(next_game_state, depth += 1, {})
      end

      if depth == game_state.board.available_moves.length
        return move_scores.max_by { |move, score| score }[0]
      end

      if game_state.current_player_mark == mark
        return move_scores.max_by { |move, score| score }[1]
      end

      if game_state.current_player_mark == opponent_mark
        return move_scores.min_by { |move, score| score }[1]
      end
    end

    def opponent_mark
      @mark == "X" ? "O" : "X"
    end
  end
end
