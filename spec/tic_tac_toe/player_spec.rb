require 'tic_tac_toe/player'

describe TicTacToe::Player do
  describe "#create" do
    it "creates a human player with mark X" do
      player = TicTacToe::Player.create(TicTacToe::Human, "X")
      expect(player).to be_kind_of(TicTacToe::Human)
      expect(player.mark).to eql "X"
    end

    it "creates a human player with mark O" do
      player = TicTacToe::Player.create(TicTacToe::Human, "O")
      expect(player).to be_kind_of(TicTacToe::Human)
      expect(player.mark).to eql "O"
    end

    it "creates a computer player with mark X" do
      player = TicTacToe::Player.create(TicTacToe::Computer, "X")
      expect(player).to be_kind_of(TicTacToe::Computer)
      expect(player.mark).to eql "X"
    end

    it "creates a computer player with mark O" do
      player = TicTacToe::Player.create(TicTacToe::Computer, "O")
      expect(player).to be_kind_of(TicTacToe::Computer)
      expect(player.mark).to eql "O"
    end
  end
end