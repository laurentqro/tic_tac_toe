require 'tic_tac_toe/player'

module TicTacToe
  class Computer < Player
    attr_accessor :mark

    STRATEGIES = {
      win: lambda { |context| return context.winning_space(context.mark) },
      block_win: lambda { |context| return context.winning_space(context.opponent_mark) },
      fork: lambda { |context| return context.space_to_fork(context.mark, context.board) },
      block_fork: lambda { |context| return context.attacking_moves.first || context.space_to_fork(context.opponent_mark, context.board) },
      play_center: lambda { |context| return 5 if context.board.available_moves.include? 5 },
      play_opposite_corner: lambda { |context| return context.available_opposite_corner.first },
      play_corner: lambda { |context| return context.board.corners.grep(Fixnum).first },
      play_free_space: lambda { |context| return context.board.available_moves.first }
    }

    def choose_mark
      opponent_mark = ["X", "O"].find { |mark| board.grid.grep(mark).count.odd? }
      opponent_mark == "X" ? @mark = "O" : @mark = "X"
    end

    def pick_move
      mark = @mark || choose_mark
      best_strategy = STRATEGIES.values.find { |strategy| strategy.call(self) }
      best_strategy.call(self)
    end

    # Public helper methods

    def winning_space(mark)
      winning_spaces(mark, board).first
    end

    def opponent_mark
      @mark == "X" ? "O" : "X"
    end

    def space_to_fork(mark, board)
      board.available_moves.find do |space|
        fake_board = create_fake_board
        fake_board.mark_space(space, mark)
        winning_spaces(mark, fake_board).count == 2
      end
    end

    def attacking_moves
      spaces_on_triples_with_only_one_mark(mark).reject { |move| results_in_space_to_fork?(move) }
    end

    def available_opposite_corner
      board.grid.map.with_index do |space, index|
        board.opposite_corner(index) if space == opponent_mark && board.opposite_corner(index).is_a?(Fixnum)
      end
    end

    private

    def winning_spaces(mark, board)
      winning_triples(mark, board).map do |winning_triple|
        available_space_on_triple(winning_triple)
      end
    end

    def winning_space_on_triple?(mark, triple)
      two_in_a_row_on_triple?(mark, triple) && available_space_on_triple?(triple)
    end

    def two_in_a_row_on_triple?(mark, triple)
      triple.count(mark) == 2
    end

    def available_space_on_triple(triple)
      triple.grep(Integer)[0]
    end

    def available_space_on_triple?(triple)
      available_space_on_triple(triple) != nil
    end

    def results_in_space_to_fork?(move)
      board.available_moves.any? do |space|
        fake_board = create_fake_board
        fake_board.mark_space(space, mark)
        space_to_fork(opponent_mark, fake_board) == nil
      end
    end

    def winning_triples(mark, board)
      board.triples.select do
        |triple| winning_space_on_triple?(mark, triple)
      end
    end

    def create_fake_board
      TicTacToe::Board.new(board.grid.dup)
    end

    def triples_with_only_one_mark(mark)
      board.triples.select do |triple|
        triple.grep(Fixnum).count == 2 && triple.grep(mark).count == 1
      end
    end

    def spaces_on_triples_with_only_one_mark(mark)
      if triples_with_only_one_mark(mark).any?
        triples_with_only_one_mark(mark).flatten!.uniq.grep(Integer)
      else
        []
      end
    end
  end
end
