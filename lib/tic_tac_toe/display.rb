module TicTacToe
  class Display

    def initialize(input: input = $stdin, output: output = $stdout)
      @input = input
      @output = output
    end

    def output_game_title
      @output.puts "** TicTacToe **"
    end

    def get_mark
      @output.puts "Choose your mark:"
      @output.puts "\s1: X"
      @output.puts "\s2: O"
      @input.gets.chomp.to_i
    end

    def output_board(grid)
      @output.puts " #{grid[0]} | #{grid[1]} | #{grid[2]}\n---+---+---\n #{grid[3]} | #{grid[4]} | #{grid[5]}\n---+---+---\n #{grid[6]} | #{grid[7]} | #{grid[8]}\n"
    end

    def get_move
      @output.puts "Please enter the number of a space to mark it:"
      get_user_input
    end

    def clear_screen
      @output.puts "\e[2J\e[f"
    end

    def output_line_space
      @output.puts "\s"
    end

    def output_win_announcement
      @output.puts "Congratulations, you won!"
    end

    def output_loss_announcement
      @output.puts "Oh no, you lost!"
    end

    def output_draw_announcement
      @output.puts "Draw!"
    end

    def output_invalid_move_message
      @output.print "You entered an invalid move.\s"
    end

    private

    def get_user_input
      @input.gets.chomp.to_i
    end
  end
end