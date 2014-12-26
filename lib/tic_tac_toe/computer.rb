module TicTacToe
  class Computer
    attr_accessor :mark, :board

    def choose_mark
      opponent_mark = ["X", "O"].find { |mark| board.grid.grep(mark).count.odd? }
      opponent_mark == "X" ? @mark = "O" : @mark = "X"
    end

    def pick_move(board)
      mark = @mark || choose_mark(board)

      if winning_spaces(mark, board).any?
        return winning_space(mark, board)
      end

      if winning_spaces(opponent_mark, board).any?
        return winning_space(opponent_mark, board)
      end

      if space_to_fork(mark, board)
        return space_to_fork(mark, board)
      end

      if triples_with_only_one_mark(mark, board).any? && space_to_fork(opponent_mark, board)
        attacking_moves  = spaces_on_triples_with_only_one_mark(mark, board).reject do |space|
          results_in_space_to_fork?(space, board)
        end
        return attacking_moves.first || space_to_fork(opponent_mark, board)
      end

      if board.available_moves.include? 5
        return 5
      end

      if board.corners.include? opponent_mark && available_opposite_corner(board)
        return available_opposite_corner(board)
      end

      if board.corners.any? { |corner| board.available_moves.include? corner }
        return board.corners.grep(Fixnum).first
      end

      if board.available_moves.any?
        return board.available_moves.first
      end
    end

    private

    def winning_space(mark, board)
      winning_spaces(mark, board).first
    end

    def winning_spaces(mark, board)
      winning_triples(mark, board).map do |winning_triple|
        available_space_on_triple(winning_triple)
      end
    end

    def space_to_fork(mark, board)
      board.available_moves.find do |space|
        fake_board = create_fake_board(board)
        fake_board.mark_space(space, mark)
        winning_spaces(mark, fake_board).count == 2
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

    def opponent_mark
      @mark == "X" ? "O" : "X"
    end

    def results_in_space_to_fork?(move, board)
      board.available_moves.any? do |space|
        fake_board = create_fake_board(board)
        fake_board.mark_space(space, mark)
        space_to_fork(opponent_mark, fake_board) == nil
      end
    end

    def winning_triples(mark, board)
      board.triples.select do
        |triple| winning_space_on_triple?(mark, triple)
      end
    end

    def create_fake_board(board)
      TicTacToe::Board.new(board.grid.dup)
    end

    def triples_with_only_one_mark(mark, board)
      board.triples.select do |triple|
        triple.grep(Fixnum).count == 2 && triple.grep(mark).count == 1
      end
    end

    def spaces_on_triples_with_only_one_mark(mark, board)
      triples_with_only_one_mark(mark, board).flatten!.uniq.grep(Integer)
    end

    def available_opposite_corner(board)
      board.grid.map.with_index do |space, index|
        return board.opposite_corner(index) if space == opponent_mark && board.opposite_corner(index).is_a?(Fixnum)
      end
    end
  end
end
