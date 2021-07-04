require_relative "board"
require_relative "player"

class Battleship
    def initialize(length)
        @player = Player.new()
        @board = Board.new(length)
        @remaining_misses = (@board.size * 0.5).round
    end

    attr_reader :board, :player

    def start_game
        @board.place_random_ships
        print @board.num_ships
        puts
        @board.print
    end

    def lose?
        if @remaining_misses <= 0
            print 'you lose'
            puts
            return true
        else
            return false
        end
    end

    def win?
        if @board.num_ships <= 0
            print 'you win'
            puts
            return true
        else
            return false
        end
    end

    def game_over?
        self.win? || self.lose?
    end

    def turn
        if !@board.attack(@player.get_move)
            @remaining_misses -= 1
        end
        @board.print
        print @remaining_misses
        puts
    end
end
