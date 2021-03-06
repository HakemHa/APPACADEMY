require_relative "code"

class Mastermind
    def initialize(length)
        @secret_code = Code.random(length)
    end

    def print_matches(guess)
        print "Exact Matches: " + @secret_code.num_exact_matches(guess).to_s
        puts
        print "Near Matches: " + @secret_code.num_near_matches(guess).to_s
        puts
    end
    def ask_user_for_guess
        print 'Enter a code: '
        guess = Code.from_string(gets.chomp)
        print_matches(guess)
        guess == @secret_code
    end
end
