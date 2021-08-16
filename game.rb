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
        until @game_status == 0

            @player = @players[@counter % 2]
            @other_player = @players[(@counter + 1) % 2]

            question = Question.new
            print " #{@player.name}: what does #{question.num1} + #{question.num2} equal? \n"
            input = gets.chomp.to_i

            if input != question.answer
                puts "#{@player.name} Seriously? No!"
                @player.reduce_life
                if check_life
                    @game_status = 0

                    puts "#{@other_player.name} is the winner with a score of #{@other_player.lives}/3 "
                    puts "---GAME OVER---"
                    puts "Good bye!"
                else
                puts "p1 #{@players[0].lives}/3 VS P2 #{@players[1].lives}/3"
                puts "----NEW TURN----"
                end
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
            return true
        end

    end

    def switch_player
        @counter += 1
    end





end