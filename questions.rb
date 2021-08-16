class Question

    attr_accessor :num1, :num2, :answer
    def initialize
        @num1 = rand(1..20)
        @num2 = rand(1..20)
        @answer = @num1.to_i + @num2.to_i
    end

    def ask_question

        print " #{player}: what does #{question.num1} + #{question.num2} equal? \n"

    end
    def val(answer)
        answer == @answer
    end
end





