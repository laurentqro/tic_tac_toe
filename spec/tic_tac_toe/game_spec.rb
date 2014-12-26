require 'tic_tac_toe/board'
require 'tic_tac_toe/computer'
require 'tic_tac_toe/human'
require 'tic_tac_toe/display'
require 'tic_tac_toe/game'

describe TicTacToe::Game do

  let(:board) { TicTacToe::Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9]) }
  let(:computer) { TicTacToe::Computer.new }
  let(:human) { TicTacToe::Human.new }
  let(:input) { StringIO.new }
  let(:output) { StringIO.new }
  let(:display) { TicTacToe::Display.new(input: input, output: output) }
  let(:game) { TicTacToe::Game.new(board: board, computer: computer, human: human, display: display) }

  describe "#play" do
    it "plays a new game" do
      expect(display).to receive(:get_mark).and_return(1)
      expect(human).to receive(:pick_move).and_return(1)
      expect(computer).to receive(:pick_move).and_return(5)
      expect(human).to receive(:pick_move).and_return(9)
      expect(computer).to receive(:pick_move).and_return(4)
      expect(human).to receive(:pick_move).and_return(6)
      expect(computer).to receive(:pick_move).and_return(3)
      expect(human).to receive(:pick_move).and_return(7)
      expect(computer).to receive(:pick_move).and_return(8)
      expect(human).to receive(:pick_move).and_return(2)
      game.play
    end
  end

  describe "#next_player" do
    context "when the current player is human, next player is computer" do
      it "sets the game's current player to computer" do
        game.current_player = human
        game.next_player
        expect(game.current_player).to eql computer
      end
    end
  end

  describe "#make_move" do
    it "makes the current player make a move" do
      game.current_player = [human, computer].sample
      allow(board).to receive(:mark_space)
      allow(game.current_player).to receive(:pick_move).and_return(3)
      game.make_move(game.current_player)
      expect(board).to have_received(:mark_space).with(3, game.current_player.mark)
    end
  end

  describe "#display_outcome" do
    context "when there is a winner" do
      it "announce winner" do
        game.current_player = [human, computer].sample
        allow(board).to receive(:winner?).and_return(true)
        allow(display).to receive(:output_win_announcement_for)
        game.display_outcome
        expect(display).to have_received(:output_win_announcement_for).with(game.current_player.mark)
      end
    end

    context "when the game draws" do
      it "announces draw" do
        allow(board).to receive(:draw?).and_return(true)
        allow(display).to receive(:output_draw_announcement)
        game.display_outcome
        expect(display).to have_received(:output_draw_announcement)
      end
    end
  end

  describe "#set_human_mark" do
    it "sets human mark to X" do
      allow(display).to receive(:get_mark).and_return(1)
      game.set_human_mark
      expect(human.mark).to eql "X"
    end

    it "sets human mark to O" do
      allow(display).to receive(:get_mark).and_return(2)
      game.set_human_mark
      expect(human.mark).to eql "O"
    end
  end

  describe "#get_valid_move_from" do
    it "asks for a move until it is a valid one" do
      expect(human).to receive(:pick_move).and_return("gibberish")
      expect(human).to receive(:pick_move).and_return(10)
      expect(human).to receive(:pick_move).and_return(1)
      expect(game.get_valid_move_from(human)).to eql 1
    end
  end
end