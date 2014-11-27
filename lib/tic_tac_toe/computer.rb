module TicTacToe
  class Computer
    attr_accessor :mark

    def initialize(mark: mark)
      @mark = mark
    end

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
      board.mark_space(space, mark)
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
			end

			if winning_space?(opponent_mark, board)
				best_move = winning_space(opponent_mark, board)
			end
			best_move
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

  end
end
