require "tic_tac_toe/computer"
require "tic_tac_toe/board"
require 'tic_tac_toe/player'

describe TicTacToe::Computer do

  let(:computer) { TicTacToe::Computer.new }

  before(:example) do
    computer.mark = "X"
  end

  describe "#choose_mark" do
    it "chooses O if first player made first move with X" do
      computer.board = TicTacToe::Board.new ["X", 2, 3, 4, 5, 6, 7, 8, 9]
      computer.choose_mark
      expect(computer.mark).to eql "O"
    end

    it "chooses X if first player made first move with O" do
      computer.board = TicTacToe::Board.new [1, "O", 3, 4, 5, 6, 7, 8, 9]
      computer.choose_mark
      expect(computer.mark).to eql "X"
    end
  end

  describe "#pick_move" do
    it "goes for the win" do
      board = TicTacToe::Board.new ["O", "X",  3,
                                     4,  "X", "X",
                                    "O", "O",  9]
      computer.board = board
      expect(computer.pick_move).to eql 4
    end

    it "blocks opponent's win" do
      board = TicTacToe::Board.new ["O", "X",  3,
                                     4,   5 ,  6,
                                     7,   8 , "O"]
      computer.board = board
      expect(computer.pick_move).to eql 5
    end

    it "creates a fork (two threats to win)" do
      board = TicTacToe::Board.new ["X", "O",  3,
                                     4,  "X",  6,
                                     7,   8,  "O"]
      computer.board = board
      expect(computer.pick_move).to eql 4
    end

    it "creates two in a row to force the opponent into defending" do
      board = TicTacToe::Board.new ["O",  2,   3,
                                     4,  "X",  6,
                                     7,   8,  "O"]
      computer.board = board
      expect(computer.pick_move).to eql 2
    end
  end
end
