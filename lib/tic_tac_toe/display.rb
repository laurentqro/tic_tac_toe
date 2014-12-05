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

    def get_user_input
      @input.gets.chomp.to_i
    end

    def output_prompt_for_move
      @output.puts "Please enter the number of a space to mark it:"
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
  end
end