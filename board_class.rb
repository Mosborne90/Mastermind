module BoardClass

  class Board
    attr_accessor :turns, :code_pegs, :code, :winner

    def initialize()
      @turns = 0
      @code_pegs = ['r', 'o', 'y', 'g', 'b', 'p'] * 2
      @code = []
      @winner = nil
    end

    def start_game_message
      "The Code Maker has generated a 4 color code...".each_char do |c|
        print c
        sleep(0.02)
      end

      sleep(1)

      "\nThe same color can be used more than once...".each_char do |c|
        print c
        sleep(0.02)
      end

      sleep(1)

      "\nYou have #{@turns} chances to decode the combination or you will lose the game...".each_char do |c|
      print c
      sleep(0.02)
      end

      sleep(1)

      "\nGood luck Code Breaker...".each_char do |c|
      print c
      sleep(0.02)
      end

      sleep(2.5)
    end

    def draw_board
      Console.clear_terminal
      puts "Possible Colors:"
      puts "\n | Red | Blue | Green | Orange | Pink | Yellow |"
      puts "\nHint Markers:"
      puts "\n | Black: One color is correct and in the right position"
      puts " | White: One color is correct but the position is incorrect"
      puts "\n***Decode attempts remaining: #{@turns}***"
      puts "\n[\"?\", \"?\", \"?\", \"?\"] | Code"
      puts "\n"

      $code_breaker.attempts.each_with_index {|arr, i| puts "#{arr} | Hints: #{$code_maker.hints[i]}"}
      print "\n\n\n\nEnter a 4 character code using the first letter of each color: "
    end

    def check_turns_remaining
      if @turns == 0
        @winner = "CM"
        $game_active = false
      end
    end

    def check_code_solved
      if @code_array == $code_breaker.attempts[-1]
        @winner = "CB"
        $game_active = false
      end
    end
  end
  
end