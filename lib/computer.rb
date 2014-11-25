module TicTacToe
  class Computer
    attr_accessor :mark
    
    def initialize(mark: mark)
      @mark = mark
    end
    
    def winning_space(mark, board)
      winning_triple = board.triples.find do
        |triple| winning_space_on_triple?(mark, triple)
      end
      available_space_on_triple(winning_triple)
    end

    def opponent_winning_space(board)
      winning_space(opponent_mark, board)
    end

    def make_move(space, board)
      board.mark_space(space, mark)
    end

    def space_to_fork(mark, board)
      spaces = board.triples.select do |triple|
        triple.grep(mark).count == 1 && triple.grep(Fixnum).count == 2
      end
      spaces.flatten!
      spaces.detect { |e| spaces.count(e) > 1 }
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

  end
end
