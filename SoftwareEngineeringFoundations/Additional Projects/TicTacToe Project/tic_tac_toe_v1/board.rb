require 'byebug'

class Board
    def initialize
        @board = Array.new(3) {|i, e| e = Array.new(3) {|i, e| e = '_'}}
    end
    def valid?(pos)
        !@board[pos[0]][pos[1]] .nil?
    end
    def empty?(pos)
        @board[pos[0]][pos[1]] == '_'
    end
    def place_mark(pos, m)
        if 
            !valid?(pos) || !empty?(pos)
            raise 'Invalid position'
        else
            @board[pos[0]][pos[1]] = m
        end
    end
    def print
        @board.each {|row| p row}
    end
    def win_row?(m)
        if @board.any?{|r| r.all? {|i| i == m}}
            return true
        else
            return false
        end
    end
    def win_col?(m)
        @board.length.times do |c|
            col = []
            @board.length.times do |r| 
                col << @board[r][c]
            end
            if col.all? {|e| e == m}
                return true
            end
        end
        return false
    end
    def win_diagonal?(m)
        dgn = []
        adgn = []
        @board.length.times do |i|
            dgn << @board[i][i]
            adgn << @board[i][@board.length - (i + 1)]
        end
        if dgn.all? {|e| e == m} || adgn.all? {|e| e == m}
            return true
        else
            return false
        end
    end
    def win?(m)
        if win_col?(m) || win_row?(m) || win_diagonal?(m)
            return true
        else
            return false
        end
    end
    def empty_positions?
        @board.any? {|r| r.any? {|e| e == '_'}}
    end
end