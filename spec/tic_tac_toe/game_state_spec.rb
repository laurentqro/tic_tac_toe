require 'tic_tac_toe/game_state'
require 'tic_tac_toe/board'
require 'tic_tac_toe/computer'

describe TicTacToe::GameState do

  describe "#final_state_score" do
    context "when game is in final state" do
      it "returns 1 if maximizing player win" do
        board = TicTacToe::Board.new ["X", "O", 3, 4, "X", "O", 7, 8, "X"]
        game_state = TicTacToe::GameState.new(board, "X", "X")
        expect(game_state.final_state_score).to eql 1
      end

      it "returns 0 if draw" do
        board = TicTacToe::Board.new ["X", "O", "X", "O", "X", "O", "O", "X", "O"]
        game_state = TicTacToe::GameState.new(board, "X", "X")
        expect(game_state.final_state_score).to eql 0
      end

      it "returns -1 if maximizing player loss" do
        board = TicTacToe::Board.new ["O", "X", 3, 4, "O", "X", 7, 8, "O"]
        game_state = TicTacToe::GameState.new(board, "X", "X")
        expect(game_state.final_state_score).to eql -1
      end
    end
  end
end