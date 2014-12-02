module TicTacToe
  class Display

    def initialize(input: input = $stdin, output: output = $stdout)
      @input = input
      @output = output
    end

    def output_game_title
      @output.puts "** TicTacToe **"
    end

    def output_choice_of_mark
      @output.puts "Choose your mark:\n1: X\n 2: O"
    end

    def output_board(grid)
      @output.puts " #{grid[0]} | #{grid[1]} | #{grid[2]}\n---+---+---\n #{grid[3]} | #{grid[4]} | #{grid[5]}\n---+---+---\n #{grid[6]} | #{grid[7]} | #{grid[8]}\n"
    end
  end
end