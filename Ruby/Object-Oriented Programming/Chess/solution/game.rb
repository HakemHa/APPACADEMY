require_relative "player"

class Game
    attr_reader :board, :display
    def initialize
        @board = Board.new
        @display = Display.new(board)
        @players = {0 => HumanPlayer.new("white", display), 1 => HumanPlayer.new("black", display)}
        @current_player = @players[0]
    end

    def play 
        # require 'byebug'
        # debugger
        until board.in_checkmate?(@current_player.color)
            notify_players
            display.render
            board.move_piece(@current_player.make_move(board))
            swap_turn!
        end
    end

    private 

    def notify_players
        "#{@current_player.color}'s turn"
    end

    def swap_turn!
        @current_player = @current_player == @players[0] ? @players[1] : @players[0]
    end
end