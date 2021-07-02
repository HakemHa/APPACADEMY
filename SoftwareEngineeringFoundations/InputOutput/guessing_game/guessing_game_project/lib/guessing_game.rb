require 'byebug'

class GuessingGame
    def initialize(min, max)
        @secret_num = rand(min...max)
        @num_attempts = 0
        @game_over = false
    end

    def num_attempts
        @num_attempts
    end

    def game_over?
        @game_over
    end

    def check_num(guess)
        @num_attempts += 1
        if @secret_num == guess
            print 'you win'
            @game_over = true
        elsif guess > @secret_num
            print 'too big'
            @game_over = false
        elsif guess < @secret_num
            print 'too small'
            @game_over = false
        else 
            print 'not a number'
        end
    end

    def ask_user
        print 'enter a number '
        guess = gets.chomp.to_i
        check_num(guess)
    end
end
