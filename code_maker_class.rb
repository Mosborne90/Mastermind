module CodeMakerClass

  class CodeMaker
    attr_accessor :name, :hints, :counter

    def initialize()
      @name = "Code Maker"
      @hints = []
    end

    def generate_code
      $board.code = $board.code_pegs.sample(4)
    end

    def generate_hints
      code = $board.code
      attempt = $code_breaker.attempts[-1]
      hint = []

      code.each_with_index do |char, index|
        if attempt[index] == char
          hint.push('Black')
        elsif code.include?(attempt[index])
          hint.push('White')
        end
      end
      @hints.push(hint)
    end

  end
end