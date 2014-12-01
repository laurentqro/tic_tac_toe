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
  end
end