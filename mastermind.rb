require_relative "console_methods"
require_relative "board_class"
require_relative "code_maker_class"
require_relative "code_breaker_class"
include Console
include BoardClass
include CodeMakerClass
include CodeBreakerClass

$code_breaker = nil
$code_maker = nil
$board = nil
$game_active = false

loop do
  Console.main_menu
  $board.start_game_message

  while $game_active do
    $board.draw_board
    $code_breaker.decipher_attempt
    $board.check_code_solved
    $board.check_turns_remaining
    $code_maker.generate_hints
  end

  Console.game_over
  Console.reset_game
end