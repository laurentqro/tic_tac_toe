require 'tic_tac_toe/game_state'
require 'tic_tac_toe/board'
require 'tic_tac_toe/computer'

describe TicTacToe::GameState do

  let(:player_x) { TicTacToe::Computer.new(mark: "X") }
  let(:player_o) { TicTacToe::Computer.new(mark: "O") }

  describe "#final_state_score" do
    it "returns 1 for current player win" do
      board = TicTacToe::Board.new ["X", "O",  3,
                                     4,  "X", "O",
                                     7,   8,  "X"]
      game_state = TicTacToe::GameState.new(board, "X")
      expect(game_state.final_state_score).to eql 1
    end

    it "returns 0 if draw" do
      board = TicTacToe::Board.new ["X", "O", "X", "O", "X", "O", "O", "X", "O"]
      game_state = TicTacToe::GameState.new(board, "X")
      expect(game_state.final_state_score).to eql 0
    end

    it "returns -1 for current player loss" do
      board = TicTacToe::Board.new ["O", "X", 3, 4, "O", "X", 7, 8, "O"]
      game_state = TicTacToe::GameState.new(board, "X")
      expect(game_state.final_state_score).to eql -1
    end
  end

  describe "#generate_tree" do
    it "generates the game tree for the given game state" do
      board = TicTacToe::Board.new [1, 2, 3, 4, 5, 6, 7, 8, 9]
      game_state = TicTacToe::GameState.new(board, "X")
      game_state.generate_tree
      expect(game_state.children.count).to eql 9
      game_state.children.each do |game_state_child|
        expect(game_state_child).to be_kind_of(TicTacToe::GameState)
      end
      expect(game_state.children.first.board.grid).to eql ["X", 2, 3, 4, 5, 6, 7, 8, 9]
      expect(game_state.children.last.board.grid).to eql [1, 2, 3, 4, 5, 6, 7, 8, "X"]
      expect(game_state.children.first.current_player_mark).to eql "O"
    end
  end
end