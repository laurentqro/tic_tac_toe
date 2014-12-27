require 'tic_tac_toe/board'
require 'tic_tac_toe/computer'
require 'tic_tac_toe/human'
require 'tic_tac_toe/display'
require 'tic_tac_toe/game'

describe TicTacToe::Game do

  let(:board) { TicTacToe::Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9]) }
  let(:player_x) { TicTacToe::Human.new(mark: "X") }
  let(:player_o) { TicTacToe::Computer.new(mark: "O") }
  let(:display) { TicTacToe::Display.new(input: StringIO.new, output: StringIO.new) }
  let(:game) { TicTacToe::Game.new(board: board, player_x: player_x, player_o: player_o, display: display) }

  describe "#play" do
    it "plays a new game" do
      expect(game.player_x).to receive(:pick_move).and_return(1)
      expect(game.player_o).to receive(:pick_move).and_return(5)
      expect(game.player_x).to receive(:pick_move).and_return(9)
      expect(game.player_o).to receive(:pick_move).and_return(4)
      expect(game.player_x).to receive(:pick_move).and_return(6)
      expect(game.player_o).to receive(:pick_move).and_return(3)
      expect(game.player_x).to receive(:pick_move).and_return(7)
      expect(game.player_o).to receive(:pick_move).and_return(8)
      expect(game.player_x).to receive(:pick_move).and_return(2)
      game.play
    end
  end

  describe "#next_player" do
    context "when the current player is X" do
      it "switches the game's current player to O" do
        game.current_player = game.player_x
        game.next_player
        expect(game.current_player).to eql game.player_o
      end
    end

    context "when the current player is O" do
      it "switches the game's current player to X" do
        game.current_player = game.player_o
        game.next_player
        expect(game.current_player).to eql game.player_x
      end
    end
  end

  describe "#make_move" do
    it "makes the current player make a move" do
      game.current_player = [player_x, player_o].sample
      allow(board).to receive(:mark_space)
      allow(game.current_player).to receive(:pick_move).and_return(3)
      game.make_move(game.current_player)
      expect(board).to have_received(:mark_space).with(3, game.current_player.mark)
    end
  end

  describe "#display_outcome" do
    context "when there is a winner" do
      it "announce winner" do
        game.current_player = [player_x, player_o].sample
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

  describe "#get_valid_move_from" do
    it "asks for a move until it is a valid one" do
      expect(player_x).to receive(:pick_move).and_return("gibberish")
      expect(player_x).to receive(:pick_move).and_return(10)
      expect(player_x).to receive(:pick_move).and_return(1)
      expect(game.get_valid_move_from(player_x)).to eql 1
    end
  end

end