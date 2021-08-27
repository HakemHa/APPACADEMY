require_relative "board"
require_relative "cursor"
require "colorize"

class Display
    attr_reader :cursor
    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], board)
    end

    def render
        @board.rows.each_with_index do |row, i|
            row.each_with_index do |piece, j|
                color = @cursor.selected ? :green : :red
                bg = [i, j] == @cursor.cursor_pos ? color : :light_black
                print piece.symbol.to_s.colorize(:background => bg, :color =>  piece.color.to_sym)
                print " ".colorize(:background => :light_black)
            end
            puts
        end
    end

    def get_input
         @cursor.get_input
         p @cursor.cursor_pos
    end

    def reset!
        @notifications.delete(:error)
    end
end

