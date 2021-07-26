require_relative 'board.rb'
require_relative 'human_player.rb'

class Game
    def initialize(p_1, p_2)
        @p_1 = HumanPlayer.new(p_1)
        @p_2 = HumanPlayer.new(p_2)
        @board = Board.new
        @crp = @p_1
    end
    def switch_turn
        if @crp == @p_1
            @crp = @p_2
        else
            @crp = @p_1
        end
    end
    def play
        while @board.empty_positions?
            @board.print
            @board.place_mark(@crp.get_position, @crp.mark)
            if @board.win?(@crp.mark)
                return p "#{@crp.mark} wins."
            else
                switch_turn
            end
        end
        return p "And that's a draw!!"
    end
end