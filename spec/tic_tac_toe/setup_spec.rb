require 'tic_tac_toe/setup'

describe TicTacToe::Setup do
  let(:display) { TicTacToe::Display.new }
  let(:setup) { TicTacToe::Setup.new(display) }

  describe "#player(mark)" do
    it "sets up human as player X" do
      allow(display).to receive(:get_player_type_for).and_return(1)
      expect(TicTacToe::Player).to receive(:create).with(TicTacToe::Human, "X")
      setup.player("X")
    end

    it "sets up human as player O" do
      allow(display).to receive(:get_player_type_for).and_return(1)
      expect(TicTacToe::Player).to receive(:create).with(TicTacToe::Human, "O")
      setup.player("O")
    end

    it "sets up computer as player X" do
      allow(display).to receive(:get_player_type_for).and_return(2)
      expect(TicTacToe::Player).to receive(:create).with(TicTacToe::Computer, "X")
      setup.player("X")
    end

    it "sets up computer as player O" do
      allow(display).to receive(:get_player_type_for).and_return(2)
      expect(TicTacToe::Player).to receive(:create).with(TicTacToe::Computer, "O")
      setup.player("O")
    end
  end
end