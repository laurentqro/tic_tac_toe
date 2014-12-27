module TicTacToe
  class Game
    attr_reader :board, :player_x, :player_o, :display
    attr_accessor :current_player

    def initialize(board: board=nil, player_x: player_x=nil, player_o: player_o=nil, display: display=nil)
      @board = board
      @display = display
      @player_x = player_x
      @player_o = player_o
      @player_x.board = @board
      @player_o.board = @board
      @player_x.display = @display
      @player_o.display = @display
    end

    def play
      display.output_board(board.grid)
      @current_player = player_x
      make_move(current_player)

      until board.winner? || board.draw?  do
        next_player
        make_move(current_player)
      end

      display_outcome
    end

    def next_player
      @current_player == player_x ? @current_player = player_o : @current_player = player_x
    end

    def make_move(player)
      move = get_valid_move_from(player)
      board.mark_space(move, player.mark)
      display.clear_screen
      display.output_board(board.grid)
    end

    def get_valid_move_from(player)
      move = player.pick_move
      until board.is_valid_move?(move)
        move = player.pick_move
      end
      return move
    end

    def display_outcome
      if board.winner?
        display.output_win_announcement_for(current_player.mark)
      end

      if board.draw?
        display.output_draw_announcement
      end
    end

  end
end