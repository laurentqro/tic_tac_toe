require 'tic_tac_toe/game_state'
require 'tic_tac_toe/game'

describe TicTacToe::GameState do

  let(:player_x) { TicTacToe::Computer.new(mark: "X") }
  let(:player_o) { TicTacToe::Computer.new(mark: "O") }

  describe "#score" do
    it "returns 1 for current player win" do
      board = TicTacToe::Board.new ["X", "O", 3, 4, "X", "O", 7, 8, "X"]
      current_player_mark = "X"
      game_state = TicTacToe::GameState.new(board, current_player_mark)
      expect(game_state.score).to eql 1
    end

    it "returns 0 if draw" do
      board = TicTacToe::Board.new ["X", "O", "X", "O", "X", "O", "O", "X", "O"]
      current_player_mark = "X"
      game_state = TicTacToe::GameState.new(board, current_player_mark)
      expect(game_state.score).to eql 0
    end

    it "returns -1 for current player loss" do
      board = TicTacToe::Board.new ["O", "X", 3, 4, "O", "X", 7, 8, "O"]
      current_player_mark = "X"
      game_state = TicTacToe::GameState.new(board, current_player_mark)
      expect(game_state.score).to eql -1
    end
  end

  describe "#generate_successors" do
    it "returns the game state's successors" do
      board = TicTacToe::Board.new [1, 2, 3, 4, 5, 6, 7, 8, 9]
      current_player_mark = "X"
      game_state = TicTacToe::GameState.new(board, current_player_mark)

      game_state.generate_successors

      expect(game_state.successors.count).to eql 9
      game_state.successors.each do |state|
        expect(state).to be_kind_of(TicTacToe::GameState)
      end
      expect(game_state.successors.first.board.grid).to eql ["X", 2, 3, 4, 5, 6, 7, 8, 9]
    end
  end
end