module TicTacToe
  class Display

    def initialize(input: input = $stdin, output: output = $stdout)
      @input = input
      @output = output
    end

    def game_title
      @output.puts "** TicTacToe **"
    end

    def choice_of_mark
      @output.puts "Choose your mark:\n1: X\n 2: O"
    end

    def board(grid)
      @output.puts " #{grid[0]} | #{grid[1]} | #{grid[2]}\n---+---+---\n #{grid[3]} | #{grid[4]} | #{grid[5]}\n---+---+---\n #{grid[6]} | #{grid[7]} | #{grid[8]}\n"
    end
  end
end