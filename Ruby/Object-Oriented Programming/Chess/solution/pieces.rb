require 'singleton'

module Slideable
    HORIZONTAL_DIRS = [ 
        [1,0], #down
        [-1, 0], #up
        [0, 1], #right
        [0,-1] #left
    ]
    DIAGONAL_DIRS = [
        [1,1], #Southeast
        [-1, 1], #Northeast
        [1, -1], #Southwest
        [-1, -1] #Northwest
    ]
    def moves
        moves_list = []
        move_dirs.each do |dx, dy|
            n = 1
            while n < 8
                break if !Board.valid_pos?([pos[0] + dx*n, pos[1] + dy*n]) || board[[pos[0] + dx*n, pos[1] + dy*n]].color == self.color
                moves_list << [pos[0] + dx*n, pos[1] + dy*n]
                n += 1
            end
            unless n >= 0
                moves_list << [pos[0] + dx*n, pos[1] + dy*n] if board[[pos[0] + dx*n, pos[1] + dy*n]].color != self.color
            end
        end
        moves_list 
    end
    
    def move_dirs
        HORIZONTAL_DIRS + DIAGONAL_DIRS
    end
end

module Stepable
    def moves
       moves_list = []
       move_diffs.each {|dx, dy| moves_list << [pos[0] + dx, pos[1] + dy] unless !board[[pos[0] + dx, pos[1] + dy]] || board[[pos[0] + dx, pos[1] + dy]].color == self.color || pos[0] + dx < 0 || pos[1] + dy < 0}
       moves_list 
    end
end

class Piece
    attr_reader :color, :pos, :board
    def initialize(board, pos, color)
        @board = board
        @pos = pos
        @color = color
    end

    def pos=(pos)
        x, y = pos
        @pos = pos
    end

    def valid_moves
        valid = []
        self.moves.each do |move|
            board_dup = board.dup
            new_pos = move.map.with_index {|mov, i| mov + i}
            board_dup.move_piece!(pos, new_pos)
            valid << move unless board_dup.in_check?(color)
        end
        valid
    end
end

class Rook < Piece
    include Slideable

    def symbol
        :R
    end
    
    private

    def move_dirs
        HORIZONTAL_DIRS
    end
end

class Bishop < Piece
    include Slideable

    def symbol
        :B
    end
    
    private

    def move_dirs
        DIAGONAL_DIRS
    end
end

class Queen < Piece
    include Slideable

    def symbol
        :Q
    end
end

class Knight < Piece
    include Stepable

    def symbol
        :K
    end

    protected

    def move_diffs
        [
            [2, 1],
            [2, -1],
            [-2, 1],
            [-2, -1],
            [1, 2],
            [1, -2],
            [-1, 2],
            [-1, -2]
        ]
    end

end

class King < Piece
    MOVES = [
        [-1, -1],
        [-1, 0],
        [-1, 1],
        [0, -1],
        [0, 1],
        [1, -1],
        [1, 0],
        [1, 1]
    ]

    include Stepable

    def symbol
        :W
    end

    protected

    def move_diffs
        [
            [-1, -1],
            [-1, 0],
            [-1, 1],
            [0, -1],
            [0, 1],
            [1, -1],
            [1, 0],
            [1, 1]
        ]
    end
end

class Pawn < Piece
    def symbol
        :O
    end

    def moves
        moves_list = []
        moves_list << [pos[0] + forward_dir, pos[1]] if board[[pos[0] + forward_dir, pos[1]]].is_a?(NullPiece)
        moves_list << [pos[0] + forward_dir*2, pos[1]] if board[[pos[0] + forward_dir*2, pos[1]]].is_a?(NullPiece)
        side_attacks.each {|atk| moves_list << [pos[0] + atk[0], pos[1] + atk[1]]}
        moves_list
    end

    def at_start_row
        if color == 'white'
            return true if pos[0] == 1
        else
            return true if pos[0] == 6
        end
        return false
    end

    private

    def forward_dir
        if color == 'white'
            return 1
        else
            return -1
        end
    end

    def forward_steps

    end

    def side_attacks
        attacks = []
       
        if color == 'white'
            attacks << [1, 1] if board[[pos[0] + 1, pos[0] + 1]]
            attacks << [1, -1] if board[[pos[0] + 1, pos[0] - 1]]
        else
            attacks << [-1, 1] if board[[pos[0] - 1, pos[0] + 1]]
            attacks << [-1, -1] if board[[pos[0] - 1, pos[0] - 1]]
        end
        attacks
    end
end

require 'singleton'

class NullPiece < Piece
    include Singleton
    def self.new
        super(nil, nil, "red")
    end

    def symbol
        " "
    end
end