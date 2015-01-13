require 'tic_tac_toe/game_state'
require 'tic_tac_toe/game'

describe TicTacToe::GameState do

  let(:player_x) { TicTacToe::Computer.new(mark: "X") }
  let(:player_o) { TicTacToe::Computer.new(mark: "O") }

  describe "#score" do
    it "returns 1 for current player win" do
      board = TicTacToe::Board.new ["X", "O", 3, 4, "X", "O", 7, 8, "X"]
      current_player = player_x
      game_state = TicTacToe::GameState.new(board, current_player)
      expect(game_state.score).to eql 1
    end

    it "returns 0 if draw" do
      board = TicTacToe::Board.new ["X", "O", "X", "O", "X", "O", "O", "X", "O"]
      current_player = player_x
      game_state = TicTacToe::GameState.new(board, current_player)
      expect(game_state.score).to eql 0
    end

    it "returns -1 for current player loss" do
      board = TicTacToe::Board.new ["O", "X", 3, 4, "O", "X", 7, 8, "O"]
      current_player = player_x
      game_state = TicTacToe::GameState.new(board, current_player)
      expect(game_state.score).to eql -1
    end
  end
end