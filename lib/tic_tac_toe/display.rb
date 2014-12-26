module TicTacToe
  class Display

    def initialize(input: input = $stdin, output: output = $stdout)
      @input = input
      @output = output
    end

    def output_game_title
      clear_screen
      @output.puts "** TicTacToe **"
      output_line_space
    end

    def get_mark
      @output.puts "Choose your mark:"
      @output.puts "\s1: X"
      @output.puts "\s2: O"
      @input.gets.chomp.to_i
    end

    def get_move
      @output.puts "Please enter the number of a space to mark it:"
      get_user_input
    end

    def clear_screen
      @output.puts "\e[2J\e[f"
    end

    def output_board(grid)
      output_game_title
      @output.puts " #{grid[0]} | #{grid[1]} | #{grid[2]}\n---+---+---\n #{grid[3]} | #{grid[4]} | #{grid[5]}\n---+---+---\n #{grid[6]} | #{grid[7]} | #{grid[8]}\n"
      output_line_space
    end

    def output_win_announcement_for(player_mark)
      @output.puts "#{player_mark} won!"
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

    def output_line_space
      @output.puts "\s"
    end
  end
end