module TicTacToe
  class Display

    def initialize(input: input = $stdin, output: output = $stdout)
      @input = input
      @output = output
    end

    def game_title
      @output.puts "** TicTacToe **"
    end
  end
end