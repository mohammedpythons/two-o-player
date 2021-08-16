require './players'
require './questions'
class Game
    attr_reader :counter
    def initialize
        @players = []
        @players[0] = Player.new("player1")
        @players[1] = Player.new("player2")
        @counter = 0
        @game_status = 1
        # @winner = nil
    end
    def start_game
        puts @counter
        until @game_status == 0
            # puts "hey i'm here while loop"
            @player = @players[@counter % 2]
            @other_player = @players[(@counter + 1) % 2]
            # ask_question(player.name)
            question = Question.new
            print " #{@player.name}: what does #{question.num1} + #{question.num2} equal? \n"
            input = gets.chomp.to_i

            if input != question.answer
                puts "#{@player.name} Seriously? No!"
                @player.reduce_life
                check_life
            else
                puts "#{@player.name} YES! You are correct!"
                puts "p1 #{@players[0].lives}/3 VS P2 #{@players[1].lives}/3"
                puts "----NEW TURN----"

            end
            switch_player
        end
    end


    def check_life
        if @player.lives == 0
            @game_status = 0

            puts "#{@player.name} is the winner"
            puts "---GAME OVER---"
            puts "Good bye!"
        end

    end

    def switch_player
        @counter += 1
    end



    # def get_current_player
    #     if counter.remainder(2) == 0
    #        return @players[0]
    #     else
    #        return @players[1]
    #     end
    # end

end