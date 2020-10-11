module CodeBreakerClass

  class CodeBreaker
    attr_accessor :name, :attempts
    
    def initialize()
      @name = "Code Breaker"
      @attempts = []
    end

    def decipher_attempt
      selection = ''
      selection = gets.chomp.downcase.split('')

      if (selection - $board.code_pegs).empty? && selection.length == 4
        @attempts.push(selection)
        $board.turns -= 1
      else
        $board.draw_board
        decipher_attempt
      end
    end

  end

end