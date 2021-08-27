require_relative 'pieces'



class Board

    def dup
        board_dup = Board.new
        self.rows.each_with_index do |row, i|
            row.each_with_index do |piece, j|
                board_dup[[i, j]] = piece
            end
        end
        board_dup
    end

    attr_reader :rows
    def initialize
        @rows = Array.new(8) {|i| e = Array.new(8) {|j| piece([i, j])}}
    end

    def self.valid_pos?(pos)
        pos.all? {|po| po >= 0 && po <= 7}
    end

    def piece(pos)
        i, j = pos
        if i < 2
            color = 'white'
            if i == 1
                return Pawn.new(self, pos, color)
            else
                case j
                when 0
                    Rook.new(self, pos, color)
                when 1
                    Knight.new(self, pos, color)
                when 2
                    Bishop.new(self, pos, color)
                when 4
                    Queen.new(self, pos, color)
                when 3
                    King.new(self, pos, color)
                when 5
                    Bishop.new(self, pos, color)
                when 6
                    Knight.new(self, pos, color)
                when 7
                    Rook.new(self, pos, color)
                end
            end
        elsif i > 5
            color = 'black'
            if i == 6
                return Pawn.new(self, pos, color)
            else
                case j
                when 0
                    Rook.new(self, pos, color)
                when 1
                    Knight.new(self, pos, color)
                when 2
                    Bishop.new(self, pos, color)
                when 4
                    Queen.new(self, pos, color)
                when 3
                    King.new(self, pos, color)
                when 5
                    Bishop.new(self, pos, color)
                when 6
                    Knight.new(self, pos, color)
                when 7
                    Rook.new(self, pos, color)
                end
            end
        else
            return NullPiece.instance
        end
    end

    def [](pos)
        return false if !Board.valid_pos?(pos)
        x, y = pos
        rows[x][y]
    end

    def []=(pos, val)
        x, y = pos
        rows[x][y] = val
    end

    def move_piece(start_pos, end_pos)
        raise 'invalid starting position' if self[start_pos].is_a?(NullPiece)
        moves_validator = self[start_pos].valid_moves
        if moves_validator.include?(end_pos) && self[end_pos].is_a?(NullPiece) #Empty space 
            self[end_pos] = self[start_pos]
            self[start_pos].pos = end_pos
            self[start_pos] = NullPiece.instance
        elsif moves_validator.include?(end_pos) && !self[end_pos].is_a?(NullPiece) #Eats piece
            self[end_pos] = self[start_pos]
            self[start_pos].pos = end_pos
            self[start_pos] = NullPiece.instance
        else #Invalid move
            raise 'invalid ending position'
        end
    end

    def move_piece!(start_pos, end_pos)
        raise 'invalid starting position' if self[start_pos].is_a?(NullPiece)
        moves_validator = self[start_pos].moves
        if moves_validator.include?(end_pos) && self[end_pos].is_a?(NullPiece) #Empty space 
            self[end_pos] = self[start_pos]
            self[start_pos].pos = end_pos
            self[start_pos] = NullPiece.instance
        elsif moves_validator.include?(end_pos) && !self[end_pos].is_a?(NullPiece) #Eats piece
            self[end_pos] = self[start_pos]
            self[start_pos].pos = end_pos
            self[start_pos] = NullPiece.instance
        else #Invalid move
            raise 'invalid ending position'
        end
    end

    def in_check?(color, pos = nil)
        king_pos = pos
        self.rows.each {|row| row.each {|piece| king_pos = piece.pos if piece.is_a?(King) && piece.color == color}}
        enemy = color == "white" ? "black" : "white"
        self.rows.each do |row|
            row.each do |piece|
                if piece.color == enemy
                    if piece.moves.include?(king_pos)
                        return true
                    end
                end
            end
        end
        return false
    end

    def in_checkmate?(color)
        king_pos = nil
        self.rows.each {|row| row.each {|piece| king_pos = piece.moves if piece.is_a?(King) && piece.color == color}}
        if king_pos.all? {|pos| in_check?(color, pos)} && !king_pos.empty?
            if in_check?(color) then return true else return 0 end
        end
        return false
    end
end

if __FILE__ == $PROGRAM_NAME
    board = Board.new
    p board[[0, 1]].moves
end