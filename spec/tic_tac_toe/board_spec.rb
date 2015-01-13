require "tic_tac_toe/board"

describe TicTacToe::Board do
  let (:board) { TicTacToe::Board.new }

  it "has a 3x3 grid" do
    expect(board.grid).to eql [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  describe "#mark_space" do
    it "marks a space with a mark" do
      mark = ["X", "O"].sample
      board.mark_space(1, mark)
      expect(board.grid).to eql [mark, 2, 3, 4, 5, 6, 7, 8, 9]
    end

    it "raises an 'Invalid move' error if unavailable space is marked" do
      board = TicTacToe::Board.new ["O", 2, 3, 4, 5, 6, 7, 8, 9]
      expect { board.mark_space(1, "X") }.to raise_error("Invalid move")
    end
  end

  describe "#available_moves" do
    it "lists all available moves" do
      board = TicTacToe::Board.new ["X", 2, 3, 4, 5, "X", 7, 8, 9]
      expect(board.available_moves).to eql [2, 3, 4, 5, 7, 8, 9]
    end
  end

  describe "#winner?" do
    it "checks for a winner" do
      board_1 = TicTacToe::Board.new ["X", "X", "X",
                                       4 , "O",  6 ,
                                      "O",  8,   9 ]
      expect(board_1.winner?).to eql true

      board_2 = TicTacToe::Board.new ["X", "O", "X",
                                       4 , "O",  6 ,
                                      "O",  8 ,  9 ]
      expect(board_2.winner?).to eql false

    end
  end

  describe "#draw?" do
    it "checks for a draw" do
      board = TicTacToe::Board.new ["X", "O", "X",
                                    "O", "X", "O",
                                    "O", "X", "O"]
      expect(board.draw?).to eql true
    end
  end

  describe "#triples" do
    it "returns the on the triples on the board" do
      board = TicTacToe::Board.new ["X", "O", "X", 4, "O", 6, 7, 8, 9]
      expect(board.triples).to eql [
        ["X", "O", "X"],
        [ 4 , "O",  6 ],
        [ 7 ,  8 ,  9 ],
        ["X",  4 ,  7 ],
        ["O", "O",  8 ],
        ["X",  6 ,  9 ],
        ["X", "O",  9 ],
        ["X", "O",  7 ]
      ]
    end
  end

  describe "#corners" do
    it "returns the corners of the board" do
      board = TicTacToe::Board.new [1, 2, 3, 4, 5, 6, 7, 8, 9]
      expect(board.corners).to eql [1, 3, 7, 9]
    end
  end

  describe "#opposite_corner" do
    it "returns the opposite corner" do
      board = TicTacToe::Board.new ["O", 2, 3, 4, 5, 6, 7, 8, 9]
      expect(board.opposite_corner(0)).to eql 9
      expect(board.opposite_corner(2)).to eql 7
      expect(board.opposite_corner(6)).to eql 3
      expect(board.opposite_corner(8)).to eql "O"
      expect(board.opposite_corner(1)).to eql nil
    end
  end

  describe "#is_valid_move?" do
    it "returns true if the chosen space is a valid move" do
      board = TicTacToe::Board.new ["O", 2, 3, 4, 5, 6, 7, 8, 9]
      expect(board.is_valid_move?(2)).to eql true
    end

    it "returns false if the chosen space is an invalid move" do
      board = TicTacToe::Board.new ["O", 2, 3, 4, 5, 6, 7, 8, 9]
      expect(board.is_valid_move?(1)).to eql false
    end
  end

  describe "#winning_mark" do
    it "returns the mark of the winner" do
      board = TicTacToe::Board.new ["X", "X", "X", 4, "O", 6 , "O", 8, 9]
      expect(board.winning_mark).to eql "X"
    end
  end

end

