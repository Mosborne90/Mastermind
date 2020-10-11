module Console
  #System Methods
  def clear_terminal
    system "cls" || "clear"
  end

  #Game Setup
  def main_menu
    Console.clear_terminal
    Console.create_board
    Console.choose_team
    Console.choose_difficulty
    Console.confirm_settings
  end

  def create_board
    $board = Board.new
  end

  def choose_team
    Console.clear_terminal
    puts "          **Welcome to Mastermind**"
    puts "\n"
    puts "The Strategy Game of Codemaker vs. Codebreaker"
    puts "\nTeam Selection: "
    puts "
    1-Code Breaker : Attempt to solve the secret code to win the game"
    #puts "2-Code Maker : Create a secret code that the Code Breaker must guess to win"
    print "\nSelect Team: "
    selection = gets.chomp.to_i

    if ![1].include?(selection) #[2] - add 2 later for code maker options
      choose_team
    end

    case selection
    when 1
      $code_breaker = CodeBreaker.new
      $code_maker = CodeMaker.new
    end

  end

  def choose_difficulty
    Console.clear_terminal
    puts "          **Welcome to Mastermind**"
    puts "\n"
    puts "The Strategy Game of Codemaker vs. Codebreaker"
    puts "\nDifficulty Selection: "
    puts "
    1-Easy: 12 Turns
    2-Medium: 10 Turns
    3-Hard: 8 Turns
    4-Codebreaker: 6 Turns"
    print "\nSelect difficulty: "

    selection = gets.chomp.to_i

    if ![1, 2, 3, 4].include?(selection)
      choose_difficulty
    end

    case selection
    when 1
      $board.turns = 12
    when 2
      $board.turns = 10
    when 3
      $board.turns = 8
    when 4
      $board.turns = 6
    end

  end

  def confirm_settings
    Console.clear_terminal
    puts "          **Welcome to Mastermind**"
    puts "\nThe Strategy Game of Codemaker vs. Codebreaker"
    puts "\n     *You've chosen to play as the #{$code_breaker.name}*"
    puts "     *The Code Breaker will have #{$board.turns} turns to decode*"
    print "\nWould you like to start the game with these settings?(y/n): "

    selection = gets.chomp.downcase

    if !['y', 'n'].include?(selection)
      confirm_settings
    end

    case selection
    when 'n'
      Console.reset_game
      Console.main_menu
    when 'y'
      Console.clear_terminal
      $code_maker.generate_code
      $game_active = true
    end

  end

  #Game Over
  def game_over
    Console.clear_terminal
    
    if $board.winner == 'CM'
      puts "Game Over!"
      puts "\nYou failed to decode the Code Maker's Code..."
      puts "\nThe hidden code was #{$board.code}"
    elsif $board.winner == "CB"
      puts "**Well Done Code Breaker!**"
      puts "\nYou've successfully decoded the message."
    end

    print "\nPress 'Enter' to play again or type 'exit': "
    response = gets.chomp.downcase

    if response == "exit"
      Console.clear_terminal
      exit
    end

  end

  def reset_game
    $code_breaker = nil
    $code_maker = nil
    $board = nil
    $game_active = false
  end

end