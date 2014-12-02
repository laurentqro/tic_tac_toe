module TicTacToe
  class Computer
    attr_accessor :mark

    def winning_space(mark, board)
    	if winning_triple = find_a_winning_triple(mark, board)
      	available_space_on_triple(winning_triple)
      end
    end

    def winning_space?(mark, board)
    	winning_space(mark, board) != nil
    end

    def opponent_winning_space(board)
      winning_space(opponent_mark, board)
    end

    def make_move(space, board)
      board.mark_space(space, self.mark)
    end

    def space_to_fork(mark, board)
      triples = board.triples.select do |triple|
        only_one_mark_on_triple?(mark, triple) && two_spaces_available_on_triple?(triple)
      end
      vacant_spaces = triples.flatten.grep(Fixnum)
      find_duplicate_in(vacant_spaces)
    end

 		def determine_best_move(board)
 			if winning_space?(self.mark, board)
				best_move = winning_space(self.mark, board)
        return best_move
			end

			if winning_space?(opponent_mark, board)
				best_move = winning_space(opponent_mark, board)
        return best_move
			end

      if space_to_fork(self.mark, board)
        best_move = space_to_fork(self.mark, board)
        return best_move
      end

      if space_to_fork(opponent_mark, board) && triples_with_only_one_mark(self.mark, board)
        attacking_moves = spaces_on_triples_with_only_one_mark(mark, board)
        best_moves = attacking_moves.reject { |move| results_in_opponent_fork?(move, board) }
        return best_moves.first
      end

      if board.available_moves.include? 5
        return 5
      end

      if board.corners.include? opponent_mark
        board.grid.map.with_index { |space, index|
          return board.opposite_corner(index) if space == opponent_mark && board.opposite_corner(index).is_a?(Fixnum)
        }
      end

      if board.corners.any? { |corner| board.available_moves.include? corner }
        return board.corners.grep(Fixnum).first
      end

      board.available_moves.first

 		end

    private

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

    def only_one_mark_on_triple?(mark, triple)
      triple.grep(mark).count == 1
    end

    def two_spaces_available_on_triple?(triple)
      triple.grep(Fixnum).count == 2
    end

    def find_duplicate_in(spaces)
      spaces.detect { |space| spaces.count(space) > 1 }
    end

    def find_a_winning_triple(mark, board)
    	board.triples.find do
        |triple| winning_space_on_triple?(mark, triple)
      end
    end

    def results_in_opponent_fork?(move, board)
      board_clone = board.clone
      board_clone.mark_space(move, self.mark)
      space_to_fork(opponent_mark, board_clone) != nil
    end

    def triples_with_only_one_mark(mark, board)
      board.triples.select { |triple| only_one_mark_on_triple?(mark, triple) }
    end

    def spaces_on_triples_with_only_one_mark(mark, board)
      triples_with_only_one_mark(mark, board).flatten!.uniq.grep(Integer)
    end

  end
end
